import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pet_care_mobile_apps/pages/clinic_detail_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ClinicCard extends StatelessWidget {
  final String clinicPoster;
  final String clinicName;
  final String clinicAddress;
  final String clinicDistance;

  const ClinicCard({
    super.key,
    required this.clinicPoster,
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
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        padding: const EdgeInsets.all(12),
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
        child: Row(
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinicName,
                    overflow: TextOverflow.ellipsis,
                    style: text13(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_hospital_outlined,
                        size: 14,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Text(
                          clinicAddress,
                          overflow: TextOverflow.ellipsis,
                          style: text10(
                            weight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.navigation,
                        size: 14,
                        color: Colors.black,
                      ),
                      Text(
                        '$clinicDistance dari Anda',
                        style: text10(
                          weight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
