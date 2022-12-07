import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_container.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';

class ReservationDetailPage extends StatelessWidget {
  static const route = '/reservation-detail-page';

  const ReservationDetailPage({super.key});

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
          'Rincian Reservasi',
          style: text14(
            weight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: SingleButtonNavigationBar(
        onPressed: () {},
        buttonText: 'Reservasi Sekarang',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              CommonContainer(
                title: 'Informasi',
                widgets: [
                  Text(
                    'Nama Klinik',
                    style: text12(
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Lilipoet Pet Clinic',
                    style: text11(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Nama Pemilik",
                    style: text12(
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    fullNameController.text,
                    style: text11(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'Nama Hewan',
                    style: text12(
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    petNameController.text,
                    style: text11(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'Jenis Hewan',
                    style: text12(
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    petTypeController.text,
                    style: text11(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Builder(
                    builder: (context) {
                      if (optionalNoteController.text.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Catatan Tambahan',
                              style: text12(
                                weight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              optionalNoteController.text,
                              style: text11(
                                weight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CommonContainer(
                title: 'Layanan',
                widgets: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: serviceList.length,
                    itemBuilder: (context, index) {
                      final Service service = serviceList[index];
                      if (service.isChecked == true) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                service.serviceName,
                                style: text12(
                                  weight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Rp ${service.servicePrice}',
                                style: text12(
                                  weight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(bottom: 9),
                    color: black10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: text13(
                          weight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          var totalPrice = 0;
                          for (var element in serviceList) {
                            if (element.isChecked == true) {
                              totalPrice += element.servicePrice;
                            }
                          }
                          return Text(
                            'Rp $totalPrice',
                            style: text13(
                              weight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CommonContainer(title: 'Metode Pembayaran', widgets: [
                Builder(
                  builder: (context) {
                    if (paymentMethod == PaymentMethod.cash) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tunai',
                            style: text12(
                              weight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Kamu harus membayar secara tunai langsung di klinik dengan memberikan informasi reservasi yang didapatkan setelah reservasi berhasil dibuat.',
                            textAlign: TextAlign.justify,
                            style: text11(
                              weight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          )
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Non Tunai',
                            style: text12(
                              weight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Setelah reservasi berhasil dibuat, segera bayar biaya reservasi dan upload bukti pembayarannya',
                            textAlign: TextAlign.justify,
                            style: text11(
                              weight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          )
                        ],
                      );
                    }
                  },
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
