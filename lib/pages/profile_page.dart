import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: text13(weight: FontWeight.w400),
        ),
      ),
      body: Container(),
    );
  }
}
