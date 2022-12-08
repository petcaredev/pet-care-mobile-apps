import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/pages/first_reservation_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_service_card_list.dart';
import 'package:pet_care_mobile_apps/widgets/common_container.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_detail_card.dart';
import 'package:pet_care_mobile_apps/providers/clinic_detail_provider.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  static const route = '/detail-page';

  final int id;

  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClinicDetailProvider>(
      create: (context) =>
          ClinicDetailProvider(apiService: ApiService(), id: id),
      child: Consumer<ClinicDetailProvider>(builder: (context, provider, _) {
        if (provider.state == ResultState.loading) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (provider.state == ResultState.hasData) {
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
                provider.detail.data.name,
                style: text14(weight: FontWeight.w500),
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: SingleButtonNavigationBar(
              onPressed: () {
                Navigator.pushNamed(context, FirstReservationPage.route,
                    arguments: id);
              },
              buttonText: 'Reservasi',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ClinicDetailCard(
                      clinicName: provider.detail.data.name,
                      clinicAddress: provider.detail.data.address,
                      clinicDistance: provider.detail.data.distance,
                      clinicPhone: provider.detail.data.phone,
                      clinicPoster: provider.detail.data.posterPath,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonContainer(
                      title: 'Layanan',
                      widgets: [
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: provider.detail.data.services
                              .map(
                                (service) => ClinicServiceCard(
                                  serviceName: service.name,
                                  serviceDescription: service.description,
                                  serviceFee: service.price,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (provider.state == ResultState.error) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Text(provider.resultError.message),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: const Center(
              child: Text('Maaf, terjadi kesalahan'),
            ),
          );
        }
      }),
    );
  }
}
