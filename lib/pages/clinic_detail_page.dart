import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/first_reservation_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_service_card_list.dart';
import 'package:pet_care_mobile_apps/widgets/detail_clinic_card.dart';
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF545454),
          ),
        ),
        title: Text(
          'Lilipoet Pet Clinic',
          style: text14(weight: FontWeight.w500),
        ),
        centerTitle: true,
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
              DetailClinicCard(
                clinicName: 'clinicName',
                clinicAddress:
                    'Jl. Kyai Mojo No.18A, Bumijo, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55231',
                clinicDistance: 0.34,
                clinicPhone: '082289760911',
                clinicPoster: 'https://picsum.photos/200/300',
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
                          color: Colors.black,
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
