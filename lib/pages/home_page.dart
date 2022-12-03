import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/login_page.dart';
import 'package:pet_care_mobile_apps/providers/bottom_navigation_bar_provider.dart';
import 'package:pet_care_mobile_apps/providers/auth_preferences_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const route = '/home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authPreferencesProvider =
          Provider.of<AuthPreferencesProvider>(context, listen: false);
      if (!authPreferencesProvider.isSignedIn) {
        Navigator.pushReplacementNamed(context, LoginPage.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, page, child) => Scaffold(
        body: page.pages[page.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              page.currentPageIndex(index);
            },
            showUnselectedLabels: false,
            currentIndex: page.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_rounded),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                activeIcon: Icon(Icons.search_rounded),
                label: 'Cari',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                activeIcon: Icon(Icons.history_rounded),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                activeIcon: Icon(Icons.person_rounded),
                label: 'Profil',
              ),
            ]),
      ),
    );
  }
}
