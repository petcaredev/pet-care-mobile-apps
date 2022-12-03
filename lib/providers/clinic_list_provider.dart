import 'package:pet_care_mobile_apps/api/clinic_api.dart';
import 'package:pet_care_mobile_apps/data/clinic_list.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClinicListProvider extends ChangeNotifier {
  final ClinicAPI clinicAPI;

  ClinicListProvider({required this.clinicAPI}) {
    _fetchAllClinicList();
  }

  late ClinicList _clinicList;
  late ResultState _state;
  String _message = '';

  ClinicList get list => _clinicList;
  ResultState get state => _state;
  String get message => _message;

  Future _fetchAllClinicList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final clinic = await clinicAPI.list(http.Client());
      if (clinic.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _clinicList = clinic;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error => $e';
    }
  }
}
