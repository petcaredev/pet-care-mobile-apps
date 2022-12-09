import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/pages/reservation_detail_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/common_container.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';

class PaymentMethodPage extends StatefulWidget {
  static const route = '/payment-method-page';

  final int id;

  const PaymentMethodPage({
    super.key,
    required this.id,
  });

  @override
  State<PaymentMethodPage> createState() => PaymentMethodPageState();
}

class PaymentMethodPageState extends State<PaymentMethodPage> {
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
          if (paymentMethod != null) {
            Navigator.pushNamed(
              context,
              ReservationDetailPage.route,
              arguments: widget.id,
            );
          } else {
            Fluttertoast.showToast(
              msg: 'Silahkan pilih metode pembayaran yang ingin Anda gunakan',
            );
          }
        },
        buttonText: 'Selanjutnya',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              CommonContainer(
                title: 'Pilih Pembayaran',
                widgets: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                                  'Kamu dapat membayar secara tunai di klinik dengan memberikan informasi reservasi.',
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
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
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
