import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_model.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class ClinicProvider extends ChangeNotifier {
  final ApiService apiService;

  ClinicProvider({required this.apiService});

  late ClinicModel _clinicModel;
  ResultState? _state;
  String _message = '';

  String get message => _message;

  ClinicModel get result => _clinicModel;

  ResultState? get state => _state;

  Future<dynamic> fetchAllClinics(String accessToken) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getAllClinics(accessToken);
      if (response.error) {
        _state = ResultState.error;
        notifyListeners();
        return _message = response.message;
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _clinicModel = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }
}
