import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  final Future<SharedPreferences> sharedPreferences;

  AuthPreferences({required this.sharedPreferences});

  static const signIn = 'SIGN_IN';
  static const userAuth = 'DATA_USER_AUTH';

  Future<bool> get isSignedIn async {
    final prefs = await sharedPreferences;
    return prefs.getBool(signIn) ?? false;
  }

  void setSignIn(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(signIn, value);
  }

  Future<dynamic> get dataUserAuth async {
    final prefs = await sharedPreferences;
    return jsonDecode(prefs.getString(userAuth) ?? '{}');
  }

  void setDataUserAuth(dynamic value) async {
    final prefs = await sharedPreferences;
    prefs.setString(userAuth, jsonEncode(value));
  }

  void clearDataUserAuth() async {
    final prefs = await sharedPreferences;
    prefs.remove(userAuth);
  }
}
