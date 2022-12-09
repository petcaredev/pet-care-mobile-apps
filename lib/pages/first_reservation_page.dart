import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/pages/second_reservation_page.dart';
import 'package:pet_care_mobile_apps/providers/clinic_detail_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:pet_care_mobile_apps/widgets/common_container.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_detail_card.dart';
import 'package:pet_care_mobile_apps/widgets/reservation_checkbox.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';
import 'package:provider/provider.dart';

class FirstReservationPage extends StatefulWidget {
  static const route = '/first-reservation-page';

  final int id;

  const FirstReservationPage({
    super.key,
    required this.id,
  });

  @override
  State<FirstReservationPage> createState() => _FirstReservationPageState();
}

class _FirstReservationPageState extends State<FirstReservationPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ClinicDetailProvider(apiService: ApiService(), id: widget.id),
      child: Consumer<ClinicDetailProvider>(
        builder: (context, provider, _) {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF545454),
                  ),
                ),
                title: Text(
                  'Reservasi',
                  style: text14(
                    weight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
              ),
              bottomNavigationBar: SingleButtonNavigationBar(
                onPressed: () {
                  for (var element in serviceList) {
                    if (element.isChecked == true && reservationDate != null) {
                      Navigator.pushNamed(context, SecondReservationPage.route);
                      break;
                    } else {
                      Fluttertoast.showToast(
                        msg:
                            'Silahkan pilih tanggal reservasi dan layanan yang Anda inginkan',
                      );
                      break;
                    }
                  }
                },
                buttonText: 'Selanjutnya',
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
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: reservationDate ?? DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2023),
                            selectableDayPredicate: (day) {
                              if ((day.isAfter(DateTime.now()
                                  .subtract(const Duration(days: 1))))) {
                                return true;
                              }
                              return false;
                            },
                            helpText: 'Pilih tanggal reservasi',
                            cancelText: 'BATAL',
                            fieldHintText: 'Masukkan tanggal reservasi',
                            fieldLabelText: 'Masukkan tanggal',
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                reservationDate = value;
                              });
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: black15),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: subColor50,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              reservationDate != null
                                  ? Text(
                                      reservationDate.toString(),
                                      style: text13(
                                        weight: FontWeight.w400,
                                        color: black35,
                                      ),
                                    )
                                  : Text(
                                      'Pilih Tanggal',
                                      style: text13(
                                        weight: FontWeight.w400,
                                        color: black35,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonContainer(
                        title: 'Pilih Layanan',
                        widgets: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider.detail.data.services.length,
                            itemBuilder: (context, index) {
                              final serviceItem =
                                  provider.detail.data.services[index];

                              bool serviceChecked = bool.hasEnvironment(
                                  serviceItem.id.toString());
                              return ReservationCheckBox(
                                serviceName: serviceItem.name,
                                servicePrice: double.parse(serviceItem.price),
                                value: serviceChecked,
                                onChanged: (value) {
                                  setState(() {
                                    serviceChecked = value!;
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (provider.state == ResultState.error) {
            return Center(
              child: Text(provider.resultError.message),
            );
          } else {
            return const Center(
              child: Text('Maaf, terjadi kesalahan'),
            );
          }
        },
      ),
    );
  }
}
