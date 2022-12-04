import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/clinic_list_page.dart';
import 'package:pet_care_mobile_apps/pages/history_page.dart';
import 'package:pet_care_mobile_apps/pages/profile_page.dart';
import 'package:pet_care_mobile_apps/pages/search_page.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> pages = [
    const ClinicListPage(),
    const SearchPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  currentPageIndex(int page) {
    currentIndex = page;
    notifyListeners();
  }

  // reset current index
  resetCurrentIndex() {
    currentIndex = 0;
    notifyListeners();
  }
}
