import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_search.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';

import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClinicSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  String query;

  ClinicSearchProvider({required this.apiService, required this.query});

  late ClinicSearch _clinicSearch;
  late ErrorResponse _errorResponse;
  ResultState? _state;
  String _message = '';

  String get message => _message;

  ClinicSearch get result => _clinicSearch;
  ErrorResponse get resultError => _errorResponse;

  ResultState? get state => _state;

  runSearch(String query) {
    this.query = query;
    searchClinic();
    notifyListeners();
  }

  Future<dynamic> searchClinic() async {
    final dataUserAuth = await getDataUserAuth();
    final accessToken = dataUserAuth['accessToken'];
    final origin = dataUserAuth['address'];

    try {
      _state = ResultState.loading;
      notifyListeners();
      final response =
          await apiService.searchClinic(accessToken, origin, query);
      if (!response.error) {
        if (response.data.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'Data tidak ditemukan';
        }
        _state = ResultState.hasData;
        notifyListeners();
        return _clinicSearch = response;
      } else {
        if (response is ErrorResponse) {
          _state = ResultState.error;
          notifyListeners();
          return _errorResponse = response;
        } else {
          _state = ResultState.error;
          notifyListeners();
          return _message = response.message;
        }
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  Future<dynamic> getDataUserAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final dataUserAuth = prefs.getString('DATA_USER_AUTH') ?? [];
    return json.decode(dataUserAuth as String);
  }
}
