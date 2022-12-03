import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pet_care_mobile_apps/data/account_data.dart';
import 'package:pet_care_mobile_apps/data/clinic_detail.dart';
import 'package:pet_care_mobile_apps/data/clinic_list.dart';
import 'package:pet_care_mobile_apps/data/clinic_search.dart';
import 'package:pet_care_mobile_apps/data/sign_in.dart';
import 'package:pet_care_mobile_apps/data/user.dart';

class ClinicAPI {
  final String baseUrl = 'https://pet-care-rest-api-production.up.railway.app';
  final String signUpUrl = '/api/auth/signup';
  final String signInUrl = '/api/auth/signin';
  final String userUrl = '/api/users/';
  final String clinicUrl = '/api/clinics';
  final String searchUrl = '/api/search/pet';

  Future<ClinicList> list(http.Client client) async {
    final response =
        await client.get(Uri.parse('$baseUrl$clinicUrl'), headers: {
      HttpHeaders.authorizationHeader:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNjY5MjIwMjM0LCJleHAiOjE2NjkzMDY2MzR9.l1TewSDlQhev5HiNguhAYYYS22gifgypuSOBg-uyChQ"
    });
    if (response.statusCode == 200) {
      return ClinicList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load clinic list');
    }
  }

  Future<ClinicDetail> detail(int id, http.Client client) async {
    final response =
        await client.get(Uri.parse('$baseUrl$clinicUrl$id'), headers: {
      HttpHeaders.authorizationHeader:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNjY5MjE1Mzc5LCJleHAiOjE2NjkzMDE3Nzl9.i8JhFt6jQFvvHN025Y55zgV0vEnrgyAqFjPNpa2kDFU'
    });
    if (response.statusCode == 200) {
      return ClinicDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load clinic detail');
    }
  }
}
