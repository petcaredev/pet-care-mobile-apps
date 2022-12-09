import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/profile_response.dart';
import 'package:pet_care_mobile_apps/utils/get_data_user_auth.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class ProfileProvider extends ChangeNotifier {
  final ApiService apiService;

  ProfileProvider({required this.apiService}) {
    fetchUserProfile();
  }

  ProfileResponse? _profileResponse;
  ResultState? _state;
  String _message = '';

  ProfileResponse? get result => _profileResponse;
  ResultState? get state => _state;
  String get message => _message;

  Future<dynamic> fetchUserProfile() async {
    final dataUserAuth = await getDataUserAuth();
    final accessToken = dataUserAuth['accessToken'];
    final id = dataUserAuth['id'];

    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getUserProfile(accessToken, id);

      if (response.data.toJson().isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
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
