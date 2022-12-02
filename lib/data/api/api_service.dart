import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:pet_care_mobile_apps/data/models/signup_response.dart';
import 'package:pet_care_mobile_apps/data/models/signin_response.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_model.dart';
import 'package:pet_care_mobile_apps/data/models/profile_response.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/data/models/form_error_response.dart';

class ApiService {
  static const baseUrl =
      'https://pet-care-rest-api-production.up.railway.app/api';

  Future<dynamic> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signin'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return SignInResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401 || response.statusCode == 404) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 422) {
      return FormErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<ClinicModel> getAllClinics(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/clinics'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ClinicModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<dynamic> getUserProfile(String accessToken, int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ProfileResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }
}
