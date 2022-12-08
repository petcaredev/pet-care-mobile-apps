import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ClinicDetailCard extends StatelessWidget {
  final String clinicName;
  final String clinicAddress;
  final String clinicDistance;
  final String clinicPhone;
  final String clinicPoster;

  const ClinicDetailCard({
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
        border: Border.all(
          width: 1,
          color: black15,
        ),
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
                    onPressed: () async {
                      final mapLink = Uri.parse(
                          'https://www.google.co.id/maps/place/${clinicAddress.split(' ').join('+')}');
                      if (await canLaunchUrl(mapLink)) {
                        launchUrl(mapLink);
                      } else {
                        throw "Couldn't launch $mapLink";
                      }
                    },
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
                  child: CachedNetworkImage(
                    imageUrl: clinicPoster,
                    width: 100,
                    height: 66.67,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                          const Icon(
                            Icons.navigation,
                            size: 14,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$clinicDistance dari Anda',
                            style: text10(
                              weight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
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
