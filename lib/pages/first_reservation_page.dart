import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';

class FirstReservationPage extends StatefulWidget {
  static const route = '/first-reservation-page';

  const FirstReservationPage({super.key});

  @override
  State<FirstReservationPage> createState() => _FirstReservationPageState();
}

DateTime? reservationDate;

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
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Reservasi',
          style: text13(
            weight: FontWeight.w400,
          ),
        ),
      ),
      bottomNavigationBar: SingleButtonNavigationBar(
        onPressed: () {},
        buttonText: 'Selanjutnya',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Klinik',
                        style: text12(
                          weight: FontWeight.w500,
                          color: subColor85,
                        ),
                      ),
                      Container(
                        height: 1,
                        color: black10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: Image(
                              image:
                                  NetworkImage('https://picsum.photos/200/300'),
                              width: 100,
                              height: 66.67,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
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
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.navigation,
                                      size: 14,
                                      color: subColor50,
                                    ),
                                    SizedBox(
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
                                    SizedBox(
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
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: reservationDate ?? DateTime.now(),
                    // initialDate: reservationDate,
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2023),
                    selectableDayPredicate: (day) {
                      if ((day.isAfter(
                              DateTime.now().subtract(Duration(days: 1)))) &&
                          (day.isBefore(
                            DateTime.now().add(
                              Duration(days: 7),
                            ),
                          ))) {
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
                  padding: EdgeInsets.symmetric(
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
                      SizedBox(
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
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: black15,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih Layanan',
                      style: text13(
                        weight: FontWeight.w400,
                        color: subColor85,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 1,
                      color: black10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}