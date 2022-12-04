import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_model.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class ClinicProvider extends ChangeNotifier {
  final ApiService apiService;

  ClinicProvider({required this.apiService});

  late ClinicModel _clinicModel;
  late ErrorResponse _errorResponse;
  ResultState? _state;
  String _message = '';

  String get message => _message;

  ClinicModel get result => _clinicModel;
  ErrorResponse get resultError => _errorResponse;

  ResultState? get state => _state;

  Future<dynamic> fetchAllClinics(String accessToken) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getAllClinics(accessToken);
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
}
