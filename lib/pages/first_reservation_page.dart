import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/pages/second_reservation_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/utils/multi_argument.dart';
import 'package:pet_care_mobile_apps/widgets/common_container.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_detail_card.dart';
import 'package:pet_care_mobile_apps/widgets/reservation_checkbox.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';

class FirstReservationPage extends StatefulWidget {
  static const route = '/first-reservation-page';

  const FirstReservationPage({super.key});

  @override
  State<FirstReservationPage> createState() => _FirstReservationPageState();
}

class _FirstReservationPageState extends State<FirstReservationPage> {
  @override
  Widget build(BuildContext context) {
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
            // print(element);
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
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: reservationDate ?? DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2023),
                    selectableDayPredicate: (day) {
                      if ((day.isAfter(
                          DateTime.now().subtract(const Duration(days: 1))))) {
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
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: serviceList.length,
                    itemBuilder: (context, index) {
                      final Service serviceItem = serviceList[index];

                      return ReservationCheckBox(
                        serviceName: serviceItem.serviceName,
                        servicePrice: serviceItem.servicePrice,
                        value: serviceItem.isChecked,
                        onChanged: (value) {
                          setState(() {
                            serviceItem.isChecked = value!;
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
  }
}
