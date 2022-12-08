import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> getDataUserAuth() async {
  final prefs = await SharedPreferences.getInstance();
  final dataUserAuth = prefs.getString('DATA_USER_AUTH') ?? [];
  return json.decode(dataUserAuth as String);
}
