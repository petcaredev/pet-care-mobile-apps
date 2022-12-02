import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/preferences/auth_preferences.dart';

class AuthPreferencesProvider extends ChangeNotifier {
  AuthPreferences authPreferences;

  AuthPreferencesProvider({required this.authPreferences}) {
    _getIsSignedIn();
    _getDataUserAuth();
  }

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  Map _dataUserAuth = {};
  Map get dataUserAuth => _dataUserAuth;

  void _getIsSignedIn() async {
    _isSignedIn = await authPreferences.isSignedIn;
    notifyListeners();
  }

  void enableSignIn(bool value) {
    authPreferences.setSignIn(value);
    _getIsSignedIn();
  }

  void _getDataUserAuth() async {
    _dataUserAuth = await authPreferences.dataUserAuth;
    notifyListeners();
  }

  void setDataUserAuth(dynamic value) {
    authPreferences.setDataUserAuth(value);
    _getDataUserAuth();
  }

  void clearDataUserAuth() {
    authPreferences.clearDataUserAuth();
    _getDataUserAuth();
  }
}
