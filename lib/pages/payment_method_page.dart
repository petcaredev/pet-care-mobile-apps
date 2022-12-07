import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/pages/reservation_detail_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_container.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';

class PaymentMethodPage extends StatefulWidget {
  static const route = '/payment-method-page';

  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => paymentMethodPageState();
}

class paymentMethodPageState extends State<PaymentMethodPage> {
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
          'Metode Pembayaran',
          style: text14(
            weight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: SingleButtonNavigationBar(
        onPressed: () {
          Navigator.pushNamed(context, ReservationDetailPage.route);
        },
        buttonText: 'Selanjutnya',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              CommonContainer(
                title: 'Pilih Pembayaran',
                widgets: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: black15,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Radio(
                          value: PaymentMethod.cash,
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tunai',
                                  style: text12(
                                    weight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Kamu dapat membayar secara tunai di klinik dengan menginformasikan ID Transaksi.',
                                  style: text11(
                                    weight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: black15,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Radio(
                          value: PaymentMethod.transfer,
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Non Tunai',
                                  style: text12(
                                    weight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Kamu dapat membayar secara non tunai dengan cara transfer melalui informasi akun rekening berikut :',
                                  style: text11(
                                    weight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PT Bank Rakyat Indonesia Tbk',
                                        style: text11(
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '002938174405491 (Lilipoet Pet Clinic)',
                                        style: text11(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
