import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/widgets/service_status_card_list.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              ServiceStatusCard(
                name: "Ma'mur Zaky Nurrokhman",
                petName: "Annabul M",
                isDone: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
