import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/pages/payment_method_page.dart';
import 'package:pet_care_mobile_apps/providers/profile_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:pet_care_mobile_apps/widgets/custom_text_form_field.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';
import 'package:provider/provider.dart';

class SecondReservationPage extends StatefulWidget {
  static const route = '/second-reservation-page';

  final int id;

  const SecondReservationPage({
    super.key,
    required this.id,
  });

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
            Navigator.pushNamed(
              context,
              PaymentMethodPage.route,
              arguments: widget.id,
            );
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
                    Consumer<ProfileProvider>(
                      builder: (context, provider, _) {
                        if (provider.state == ResultState.loading) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: black15, width: 1),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: LinearProgressIndicator(
                              color: mainColor,
                              minHeight: 64,
                            ),
                          );
                        } else if (provider.state == ResultState.hasData) {
                          fullNameController.text = provider.result!.data.name;
                          return CustomTextFormField(
                            textEditingController: fullNameController,
                            textInputType: TextInputType.name,
                            validation: 'Silahkan isi nama Anda',
                            hintText: 'Nama Anda',
                          );
                        } else if (provider.state == ResultState.error) {
                          return Text(provider.message);
                        } else {
                          return const Text('Maaf, terjadi kesalahan');
                        }
                      },
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
