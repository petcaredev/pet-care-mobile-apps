import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/data/clinic_list.dart';
import 'package:pet_care_mobile_apps/pages/home_page.dart';
import 'package:pet_care_mobile_apps/providers/clinic_list_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_card_list.dart';
import 'package:provider/provider.dart';

class ClinicListPage extends StatelessWidget {
  const ClinicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Klinik Sekitar Anda',
            style: text13(weight: FontWeight.w400),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Consumer<ClinicListProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.state == ResultState.hasData) {
              return ListView.builder(
                itemCount: state.list.data.length,
                itemBuilder: (context, index) {
                  var clinicList = state.list.data[index];
                  return ClinicCard(
                    clinicName: clinicList.name,
                    clinicAddress: clinicList.address,
                    clinicDistance: 2,
                  );
                },
              );
            } else if (state.state == ResultState.noData) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                child: Text('error'),
              );
            }
          },
        ));
  }
}
