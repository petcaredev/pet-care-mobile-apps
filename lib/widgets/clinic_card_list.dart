import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pet_care_mobile_apps/pages/detail_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ClinicCard extends StatelessWidget {
  final String clinicPoster;
  final String clinicName;
  final String clinicAddress;
  final double clinicDistance;

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
        margin: const EdgeInsets.all(12),
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
                // child: Image(
                //   image: NetworkImage(clinicPoster),
                //   width: 100,
                //   height: 66.67,
                //   fit: BoxFit.fitWidth,
                // ),
                child: CachedNetworkImage(
                  imageUrl: clinicPoster,
                  width: 100,
                  height: 66.67,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
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
                      Expanded(
                        child: Text(
                          clinicAddress,
                          overflow: TextOverflow.ellipsis,
                          style: text9(
                            weight: FontWeight.w600,
                            color: subColor75,
                          ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
