import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/signup_response.dart';
import 'package:pet_care_mobile_apps/data/models/signin_response.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/data/models/form_error_response.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService apiService;

  AuthProvider({required this.apiService});

  late SignUpResponse _signUpResponse;
  late SignInResponse _signInResponse;
  late ErrorResponse _errorResponse;
  late FormErrorResponse _formErrorResponse;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  SignUpResponse get resultSignUp => _signUpResponse;
  SignInResponse get resultSignIn => _signInResponse;
  ErrorResponse get resultError => _errorResponse;
  FormErrorResponse get resultFormError => _formErrorResponse;

  ResultState get state => _state;

  Future<dynamic> signIn(String email, String password) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.signIn(email, password);
      if (response.error) {
        if (response is ErrorResponse) {
          _state = ResultState.error;
          notifyListeners();
          return _errorResponse = response;
        } else if (response is FormErrorResponse) {
          _state = ResultState.error;
          notifyListeners();
          return _formErrorResponse = response;
        }
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _signInResponse = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }
}
