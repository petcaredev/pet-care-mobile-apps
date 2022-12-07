import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/profile_response.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class ProfileProvider extends ChangeNotifier {
  final ApiService apiService;

  ProfileProvider({required this.apiService});

  late ProfileResponse _profileResponse;
  late ErrorResponse _errorResponse;
  ResultState? _state;
  String _message = '';

  String get message => _message;

  ProfileResponse get result => _profileResponse;
  ErrorResponse get resultError => _errorResponse;

  ResultState? get state => _state;

  Future<dynamic> fetchUserProfile(String accessToken, int id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getUserProfile(accessToken, id);
      if (response.error) {
        if (response is ErrorResponse) {
          _state = ResultState.error;
          notifyListeners();
          return _errorResponse = response;
        } else {
          _state = ResultState.error;
          notifyListeners();
          return _message = response.message;
        }
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _profileResponse = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }
}
