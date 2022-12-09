import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/data/reservation_data.dart';
import 'package:pet_care_mobile_apps/pages/reservation_success_page.dart';
import 'package:pet_care_mobile_apps/providers/clinic_detail_provider.dart';
import 'package:pet_care_mobile_apps/providers/profile_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:pet_care_mobile_apps/widgets/common_container.dart';
import 'package:pet_care_mobile_apps/widgets/single_button_navigation_bar.dart';
import 'package:provider/provider.dart';

class ReservationDetailPage extends StatelessWidget {
  static const route = '/reservation-detail-page';

  final int id;

  const ReservationDetailPage({super.key, required this.id});

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
        onPressed: () {
          // ApiService().addReservation(Provider.of<ProfileProvider>(context, listen: false).result!.data.id, id, , petName, petType, note, services, accessToken)
          Navigator.pushNamed(
            context,
            ReservationSuccessPage.route,
            arguments: id,
          );
        },
        buttonText: 'Reservasi Sekarang',
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
            ClinicDetailProvider(apiService: ApiService(), id: id),
        child: SingleChildScrollView(
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      'Tanggal Reservasi',
                      style: text12(
                        weight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${reservationDate!.day}/${reservationDate!.month}/${reservationDate!.year}',
                      style: text11(
                        weight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
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
                const SizedBox(
                  height: 15,
                ),
                CommonContainer(
                  title: 'Layanan',
                  widgets: [
                    Consumer<ClinicDetailProvider>(
                      builder: (context, provider, _) {
                        if (provider.state == ResultState.loading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (provider.state == ResultState.hasData) {
                          print('id clinic = $id');
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: serviceSelected.length,
                            itemBuilder: (context, index) {
                              final serviceDetail =
                                  provider.detail.data.services[index];
                              final service = serviceSelected[index];
                              final isServiceChecked = serviceChecked[index];
                              print('service selected = $serviceSelected');
                              print(
                                  'service id = ${provider.detail.data.services}');
                              if (serviceDetail.id == service) {
                                print(
                                    'service id in provider = ${serviceDetail.id}');
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        serviceDetail.name,
                                        style: text12(
                                          weight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Rp ${serviceDetail.price}',
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
                          );
                        } else if (provider.state == ResultState.error) {
                          return Text(provider.resultError.message);
                        } else {
                          return Text('Maaf, terjadi kesalahan');
                        }
                      },
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(bottom: 9),
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
                        Consumer<ClinicDetailProvider>(
                          builder: (context, provider, _) {
                            if (provider.state == ResultState.loading) {
                              return CircularProgressIndicator();
                            } else if (provider.state == ResultState.hasData) {
                              int totalPrice = 0;
                              for (var i = 0; i < serviceSelected.length; i++) {
                                for (var j = 0;
                                    j < serviceChecked.length;
                                    j++) {
                                  if (i == j) {
                                    if (serviceChecked[j] == true) {
                                      totalPrice += provider
                                          .detail.data.services[j].price;
                                    }
                                  }
                                }
                              }
                              return Text(
                                'Rp $totalPrice',
                                style: text13(
                                  weight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              );
                            } else if (provider.state == ResultState.error) {
                              return Text(provider.resultError.message);
                            } else {
                              return Text('Maaf, terjadi kesalahan');
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CommonContainer(
                  title: 'Metode Pembayaran',
                  widgets: [
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
