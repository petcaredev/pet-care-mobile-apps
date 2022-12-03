import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ServiceStatusCard extends StatelessWidget {
  final String name;
  final String petName;
  final bool isDone;

  const ServiceStatusCard({
    Key? key,
    required this.name,
    required this.petName,
    required this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: black25,
              blurRadius: 4,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 17,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lilipoet Pet Clinic',
                      style: text13(
                        weight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Nama Pemilik : $name",
                      style: text12(
                        weight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Nama Hewan : $petName",
                      style: text12(
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(7)),
                child: isDone ? Text('Selesai') : Text('Proses'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
