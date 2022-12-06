import 'package:flutter/cupertino.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_detail_model.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class ClinicDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final int clinicId;

  ClinicDetailProvider({
    required this.apiService,
    required this.clinicId,
  });

  late ClinicDetailModel _clinicDetailModel;
  late ResultState _state;
  String _message = '';

  ClinicDetailModel get detail => _clinicDetailModel;
  ResultState get state => _state;
  String get message => _message;

  Future fetchAllClinicDetail(String accessToken, int clinicId) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getClinicDetail(accessToken, clinicId);
      if (response.error) {
        _state = ResultState.error;
        notifyListeners();
        return _message = response.message;
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _clinicDetailModel = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }
}
