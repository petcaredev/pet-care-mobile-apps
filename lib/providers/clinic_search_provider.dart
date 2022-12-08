import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_search.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/utils/get_data_user_auth.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClinicSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  String query;

  ClinicSearchProvider({
    required this.apiService,
    this.query = '',
  }) {
    fetchAllClinicSearch(query);
  }

  late ClinicSearch _clinicSearch;
  late ErrorResponse _errorResponse;
  late ResultState _state;
  String _message = '';

  ClinicSearch get search => _clinicSearch;
  ErrorResponse get resultError => _errorResponse;
  ResultState get state => _state;
  String get message => _message;

  searchClinic(String newValue) {
    query = newValue;
    fetchAllClinicSearch(query);
    notifyListeners();
  }

  Future fetchAllClinicSearch(value) async {
    final dataUserAuth = await getDataUserAuth();
    final accessToken = dataUserAuth['accessToken'];
    final origin = dataUserAuth['address'];

    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.search(accessToken, origin, value);

      if (!response.error) {
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
      // if (response.data.isEmpty) {
      //   _state = ResultState.noData;
      //   notifyListeners();
      //   return _message = 'Tidak ada data';
      // } else if (response.data != null) {
      //   _state = ResultState.hasData;
      //   notifyListeners();
      //   return _clinicSearch = response;
      // } else if (response is ErrorResponse) {
      //   _state = ResultState.error;
      //   notifyListeners();
      //   return _errorResponse = response;
      // } else {
      //   _state = ResultState.error;
      //   notifyListeners();
      //   return _message = response.message;
      // }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error $e';
    }
  }
}
