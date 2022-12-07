import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/account_data.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/pages/payment_method_page.dart';
import 'package:pet_care_mobile_apps/pages/reservation_detail_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';

class SecondReservationPage extends StatefulWidget {
  static const route = '/second-reservation-page';

  const SecondReservationPage({super.key});

  @override
  State<SecondReservationPage> createState() => _SecondReservationPageState();
}

class _SecondReservationPageState extends State<SecondReservationPage> {
  final _reservationFormKey = GlobalKey<FormState>();

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
          if (_reservationFormKey.currentState!.validate()) {
            Navigator.pushNamed(context, PaymentMethodPage.route);
          }
        },
        buttonText: 'Pilih Metode Pembayaran',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Form(
                key: _reservationFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      textEditingController: fullNameController,
                      textInputType: TextInputType.name,
                      validation: 'Silahkan isi nama Anda',
                      hintText: 'Nama Anda',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: petNameController,
                      textInputType: TextInputType.name,
                      validation: 'Silahkan isi nama hewan peliharaan Anda',
                      hintText: 'Nama Hewan',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textEditingController: petTypeController,
                      textInputType: TextInputType.text,
                      validation:
                          'Silahkan masukkan jenis hewan peliharaan Anda',
                      hintText: 'Jenis Hewan',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              CustomTextFormField(
                textEditingController: optionalNoteController,
                textInputType: TextInputType.text,
                hintText: 'Catatan tambahan mengenai kondisi hewan (optional)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
