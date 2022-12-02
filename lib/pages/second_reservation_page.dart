import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/account_data.dart';
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

  TextEditingController fullNameController =
      TextEditingController(text: fullName);
  TextEditingController petNameController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController optionalNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Reservasi',
          style: text13(
            weight: FontWeight.w400,
          ),
        ),
      ),
      bottomNavigationBar: SingleButtonNavigationBar(
        onPressed: () {
          if (_reservationFormKey.currentState!.validate()) {
            Navigator.pushNamed(context, ReservationDetailPage.route);
          }
        },
        buttonText: 'Selanjutnya',
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
