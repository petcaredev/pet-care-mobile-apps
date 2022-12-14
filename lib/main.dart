import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/change_password_page.dart';
import 'package:pet_care_mobile_apps/pages/clinic_detail_page.dart';
import 'package:pet_care_mobile_apps/pages/first_reservation_page.dart';
import 'package:pet_care_mobile_apps/pages/home_page.dart';
import 'package:pet_care_mobile_apps/pages/login_page.dart';
import 'package:pet_care_mobile_apps/pages/payment_method_page.dart';
import 'package:pet_care_mobile_apps/pages/register_page.dart';
import 'package:pet_care_mobile_apps/pages/reservation_detail_page.dart';
import 'package:pet_care_mobile_apps/pages/reservation_success_page.dart';
import 'package:pet_care_mobile_apps/pages/second_reservation_page.dart';
import 'package:pet_care_mobile_apps/providers/bottom_navigation_bar_provider.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/preferences/auth_preferences.dart';
import 'package:pet_care_mobile_apps/providers/auth_preferences_provider.dart';
import 'package:pet_care_mobile_apps/providers/auth_provider.dart';
import 'package:pet_care_mobile_apps/providers/clinic_provider.dart';
import 'package:pet_care_mobile_apps/providers/profile_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const PetCareApp());
}

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<AuthPreferencesProvider>(
          create: (context) => AuthPreferencesProvider(
            authPreferences: AuthPreferences(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider<ClinicProvider>(
          create: (context) => ClinicProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(
            apiService: ApiService(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Pet Care App',
        theme: ThemeData(
          primaryColor: mainColor,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: mainColor,
            onPrimary: Colors.black,
            secondary: mainColor,
            onSecondary: mainColor,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.white,
            onBackground: mainColor,
            surface: Colors.black,
            onSurface: mainColor,
          ),
          textTheme: kTextTheme,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.route,
        routes: {
          LoginPage.route: (context) => const LoginPage(),
          RegisterPage.route: (context) => const RegisterPage(),
          HomePage.route: (context) => const HomePage(),
          DetailPage.route: (context) => DetailPage(
                id: ModalRoute.of(context)!.settings.arguments as int,
              ),
          FirstReservationPage.route: (context) => FirstReservationPage(
                id: ModalRoute.of(context)!.settings.arguments as int,
              ),
          SecondReservationPage.route: (context) => SecondReservationPage(
                id: ModalRoute.of(context)!.settings.arguments as int,
              ),
          PaymentMethodPage.route: (context) => PaymentMethodPage(
                id: ModalRoute.of(context)!.settings.arguments as int,
              ),
          ReservationDetailPage.route: (context) => ReservationDetailPage(
                id: ModalRoute.of(context)!.settings.arguments as int,
              ),
          ReservationSuccessPage.route: (context) =>
              const ReservationSuccessPage(),
          ChangePasswordPage.route: (context) => const ChangePasswordPage(),
        },
      ),
    );
  }
}
