import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: black25,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi',
                    style: text13(
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 7),
                    color: black10,
                  ),
                  Text(
                    'Nama Klinik : Lilipoet Pet Clinic',
                    style: text12(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Nama Pemilik : ${fullNameController.text}",
                    style: text12(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Nama Hewan : ${petNameController.text}",
                    style: text12(
                      weight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: black25,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Layanan',
                    style: text13(
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 7),
                    color: black10,
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
