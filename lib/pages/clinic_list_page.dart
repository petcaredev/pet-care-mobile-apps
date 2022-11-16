import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_card_list.dart';

class ClinicListPage extends StatelessWidget {
  const ClinicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Klinik Sekitar Anda',
          style: text13(weight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        // padding: EdgeInsets.all(20),
        children: [
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
          ClinicCard(
            clinicName: 'clinicName',
            clinicAddress: 'clinicAddress',
            clinicDistance: 1,
          ),
        ],
      ),
    );
  }
}
