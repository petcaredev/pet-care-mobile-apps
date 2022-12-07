import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class DetailClinicCard extends StatelessWidget {
  final String clinicName;
  final String clinicAddress;
  final double clinicDistance;
  final String clinicPhone;
  final String clinicPoster;

  const DetailClinicCard({
    Key? key,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicDistance,
    required this.clinicPhone,
    required this.clinicPoster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lokasi Klinik',
                  style: text13(
                    weight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Peta >',
                      style: text12(
                        weight: FontWeight.w500,
                        color: mainColor,
                      ),
                    ))
              ],
            ),
            Container(
              height: 1,
              color: black10,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image(
                    image: NetworkImage(clinicPoster),
                    width: 100,
                    height: 66.67,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clinicName,
                        style: text12(
                          weight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        clinicAddress,
                        style: text9(
                          weight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.navigation,
                            size: 14,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$clinicDistance km dari Anda',
                            style: text10(
                              weight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 14,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            clinicPhone,
                            style: text9(
                              weight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
