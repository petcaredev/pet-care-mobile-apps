import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ReservationDetailPage extends StatelessWidget {
  static const route = '/reservation-detail-page';

  const ReservationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Rincian Reservasi',
          style: text13(
            weight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
