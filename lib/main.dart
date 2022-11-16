import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/detail_page.dart';
import 'package:pet_care_mobile_apps/pages/home_page.dart';
import 'package:pet_care_mobile_apps/pages/login_page.dart';
import 'package:pet_care_mobile_apps/pages/register_page.dart';
import 'package:pet_care_mobile_apps/providers/bottom_navigation_bar_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PetCareApp());
}

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Pet Care App',
        theme: ThemeData(
          //   primaryColor: mainColor,
          //   scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: mainColor,
            onSecondary: mainColor,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.white,
            onBackground: Colors.white,
            surface: Colors.black,
            onSurface: Colors.white,
          ),
          textTheme: kTextTheme,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.route,
        routes: {
          LoginPage.route: (context) => LoginPage(),
          RegisterPage.route: (context) => RegisterPage(),
          HomePage.route: (context) => HomePage(),
          DetailPage.route: (context) => DetailPage(
              // id: ModalRoute.of(context)?.settings.arguments as String,
              ),
          // SearchPage.route: (context) => SearchPage(),
          // HistoryPage.route: (context) => HistoryPage(),
          // ProfilePage.route: (context) => ProfilePage(),
        },
      ),
    );
  }
}
