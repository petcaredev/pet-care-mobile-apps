import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/providers/auth_preferences_provider.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/providers/clinic_provider.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_card_list.dart';
import 'package:provider/provider.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class ClinicListPage extends StatefulWidget {
  const ClinicListPage({super.key});

  @override
  State<ClinicListPage> createState() => _ClinicListPageState();
}

class _ClinicListPageState extends State<ClinicListPage> {
  ClinicProvider? _clinicProvider;
  String? _accessToken;
  String? _origin;

  void loadClinicList() {
    setState(() {
      _clinicProvider = Provider.of<ClinicProvider>(context, listen: false);
      _clinicProvider!.fetchAllClinics(_accessToken!, _origin!);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authPreferencesProvider =
          Provider.of<AuthPreferencesProvider>(context, listen: false);
      if (authPreferencesProvider.isSignedIn) {
        _accessToken = authPreferencesProvider.dataUserAuth['accessToken'];
        _origin = authPreferencesProvider.dataUserAuth['address'];
        loadClinicList();
      }
    });
  }

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
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<ClinicProvider>(
        builder: (context, provider, _) {
          if (provider.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.state == ResultState.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: provider.result.data.length,
              itemBuilder: (context, index) {
                var clinic = provider.result.data[index];
                return ClinicCard(
                  clinicPoster: clinic.posterPath,
                  clinicName: clinic.name,
                  clinicAddress: clinic.address,
                  clinicDistance: clinic.distance,
                );
              },
            );
          } else if (provider.state == ResultState.error) {
            return Center(
              child: Text(provider.resultError.message),
            );
          } else {
            return const Center(child: Text('Maaaf, terjadi kesalahan'));
          }
        },
      ),
    );
  }
}
