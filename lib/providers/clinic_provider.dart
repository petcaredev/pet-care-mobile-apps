import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_model.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClinicProvider extends ChangeNotifier {
  final ApiService apiService;

  ClinicProvider({required this.apiService}) {
    fetchAllClinics();
  }

  late ClinicModel _clinicModel;
  late ErrorResponse _errorResponse;
  ResultState? _state;
  String _message = '';

  String get message => _message;

  ClinicModel get result => _clinicModel;
  ErrorResponse get resultError => _errorResponse;

  ResultState? get state => _state;

  Future<dynamic> fetchAllClinics() async {
    final dataUserAuth = await getDataUserAuth();
    final accessToken = dataUserAuth['accessToken'];
    final origin = dataUserAuth['address'];

    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getAllClinics(accessToken, origin);
      if (!response.error) {
        _state = ResultState.hasData;
        notifyListeners();
        return _clinicModel = response;
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
