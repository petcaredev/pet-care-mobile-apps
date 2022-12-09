import 'package:flutter/cupertino.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/models/clinic_detail_model.dart';
import 'package:pet_care_mobile_apps/data/models/error_response.dart';
import 'package:pet_care_mobile_apps/utils/get_data_user_auth.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class ClinicDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  int id;

  ClinicDetailProvider({required this.apiService, required this.id}) {
    fetchClinicDetail();
  }

  late ClinicDetailModel _clinicDetailModel;
  late ErrorResponse _errorResponse;
  ResultState? _state;
  String _message = '';

  ClinicDetailModel get detail => _clinicDetailModel;
  ErrorResponse get resultError => _errorResponse;
  ResultState? get state => _state;
  String get message => _message;

  Future fetchClinicDetail() async {
    final dataUserAuth = await getDataUserAuth();
    final accessToken = dataUserAuth['accessToken'];
    final origin = dataUserAuth['address'];

    try {
      _state = ResultState.loading;
      notifyListeners();
      final response =
          await apiService.getClinicDetail(accessToken, origin, id);
      // if (!response.error) {
      //   _state = ResultState.hasData;
      //   notifyListeners();
      //   return _clinicDetailModel = response;
      // } else {
      //   if (response is ErrorResponse) {
      //     _state = ResultState.error;
      //     notifyListeners();
      //     return _errorResponse = response;
      //   } else {
      //     _state = ResultState.error;
      //     notifyListeners();
      //     return _message = response.message;
      //   }
      // }

      if (response is ClinicDetailModel) {
        if (response.data.toJson().isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'Tidak ada data';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          return _clinicDetailModel = response;
        }
      } else if (response is ErrorResponse) {
        _state = ResultState.error;
        notifyListeners();
        return _errorResponse = response;
      } else {
        _state = ResultState.error;
        notifyListeners();
        return _message = response.message;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }
}
