import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_care_mobile_apps/data/models/add_reservation_response.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_detail_model.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_search.dart';
import 'package:pet_care_mobile_apps/data/models/reservation_response.dart';
import 'package:pet_care_mobile_apps/data/models/signup_response.dart';
import 'package:pet_care_mobile_apps/data/models/signin_response.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_model.dart';
import 'package:pet_care_mobile_apps/data/models/profile_response.dart';
import 'package:pet_care_mobile_apps/data/models/update_profile_response,dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/data/models/form_error_response.dart';

class ApiService {
  static const baseUrl =
      'https://pet-care-rest-api-production.up.railway.app/api';

  Future<dynamic> signUp(String name, String email, String password,
      String phone, String address, List<String> role) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'address': address,
        'roles': role,
      }),
    );

    if (response.statusCode == 201) {
      return SignUpResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 422) {
      return FormErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

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

  Future<dynamic> getAllClinics(String accessToken, String origin) async {
    final response = await http.get(
      Uri.parse('$baseUrl/clinics?origin=$origin'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ClinicModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403 || response.statusCode == 401) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<dynamic> getClinicDetail(
      String accessToken, String origin, int clinicId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/clinics/$clinicId?origin=$origin'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ClinicDetailModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403 || response.statusCode == 401) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<dynamic> searchClinic(
      String accessToken, String origin, String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/clinics/search/$query?origin=$origin'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ClinicSearch.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403 || response.statusCode == 401) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<ProfileResponse> getUserProfile(String accessToken, int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ProfileResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<dynamic> updateUserProfile(String name, String email, String phone,
      String address, String accessToken, int id) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
      }),
    );

    if (response.statusCode == 200) {
      return UpdateProfileResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 422) {
      return FormErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<dynamic> search(
      String accessToken, String origin, String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/clinics/search/$query'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ClinicSearch.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return ErrorResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<ReservationResponse> getReservation(String accessToken, int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/reservations/$id'),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return ReservationResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }

  Future<AddReservationResponse> addReservation(
    int userId,
    int clinicId,
    DateTime date,
    String petName,
    String petType,
    String note,
    List<int> services,
    String accessToken,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reservations'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonEncode({
        "userId": userId,
        "clinicId": clinicId,
        "date": date,
        "petName": petName,
        "petType": petType,
        "description": note,
        "services": services
      }),
    );

    if (response.statusCode == 201) {
      return AddReservationResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf, terjadi kesalahan');
    }
  }
}
