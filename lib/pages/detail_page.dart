import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/first_reservation_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_service_card_list.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';

class DetailPage extends StatelessWidget {
  static const route = '/detail-page';

  // final String id;

  const DetailPage({
    super.key,
    // required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Lilipoet Pet Clinic',
          style: text13(weight: FontWeight.w400),
        ),
      ),
      bottomNavigationBar: SingleButtonNavigationBar(
        onPressed: () {
          Navigator.pushNamed(context, FirstReservationPage.route);
        },
        buttonText: 'Reservasi',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lokasi Klinik',
                            style: text12(
                              weight: FontWeight.w500,
                              color: subColor85,
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
                            child: const Image(
                              image:
                                  NetworkImage('https://picsum.photos/200/300'),
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
                                  'clinicName',
                                  style: text12(
                                    weight: FontWeight.w500,
                                    color: subColor85,
                                  ),
                                ),
                                Text(
                                  'Jl. Kyai Mojo No.18A, Bumijo, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55231',
                                  style: text9(
                                    weight: FontWeight.w500,
                                    color: subColor50,
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
                                      color: subColor50,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '0.34 km dari Anda',
                                      style: text9(
                                        weight: FontWeight.w600,
                                        color: subColor50,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 14,
                                      color: subColor50,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '082289760911',
                                      style: text9(
                                        weight: FontWeight.w600,
                                        color: subColor50,
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
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Layanan',
                        style: text12(
                          weight: FontWeight.w500,
                          color: subColor85,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        color: black10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          ClinicServiceCard(
                            serviceName: 'Grooming Sehat',
                            serviceDescription:
                                'Grooming ini khusus untuk hewan yang sehat. Syarat bisa digrooming adalah tidak hamil, tidak demam, dan berumur diatas 2 bulan. ',
                            serviceFee: 35000,
                          ),
                          ClinicServiceCard(
                            serviceName: ' Grooming Kering',
                            serviceDescription:
                                'Grooming ini grooming yang tidak menggunakan air. Grooming kering menggunakan bedak khusus untuk mengatasi kutuan atau jamuran.',
                            serviceFee: 25000,
                          ),
                          ClinicServiceCard(
                            serviceName: 'Trimming',
                            serviceDescription:
                                'Trimming adalah potong kuku. Kuku hewan harus rutin dipotong untuk mencegah cakar melukai hewan lainya atau kita sendiri.',
                            serviceFee: 15000,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
