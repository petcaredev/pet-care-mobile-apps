import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/detail_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ClinicCard extends StatelessWidget {
  final String clinicName;
  final String clinicAddress;
  final double clinicDistance;

  const ClinicCard({
    super.key,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicDistance,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.route);
      },
      child: Container(
        margin: EdgeInsets.all(12),
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
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image(
                  image: NetworkImage('https://picsum.photos/200/300'),
                  width: 100,
                  height: 66.67,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clinicName,
                  style: text14(
                    weight: FontWeight.w600,
                    color: black75,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_hospital_outlined,
                      size: 14,
                      color: black50,
                    ),
                    Text(
                      clinicAddress,
                      style: text9(
                        weight: FontWeight.w600,
                        color: subColor75,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.navigation,
                      size: 14,
                      color: black50,
                    ),
                    Text(
                      '$clinicDistance km dari Anda',
                      style: text9(
                        weight: FontWeight.w600,
                        color: subColor75,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
