import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ClinicServiceCard extends StatelessWidget {
  final String serviceName;
  final String serviceDescription;
  final String serviceFee;

  const ClinicServiceCard({
    super.key,
    required this.serviceName,
    required this.serviceDescription,
    required this.serviceFee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: black25,
          blurRadius: 2,
          blurStyle: BlurStyle.outer,
        )
      ], borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 10, 13, 0),
            child: Text(
              serviceName,
              style: text11(
                weight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 5, 13, 10),
            child: Text(
              serviceDescription,
              style: text10(
                weight: FontWeight.w300,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            height: 1,
            color: black10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya',
                  style: text11(
                    weight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Rp $serviceFee',
                  style: text11(
                    weight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
