import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pet_care_mobile_apps/data/api/api_service.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';
import 'package:pet_care_mobile_apps/providers/clinic_search_provider.dart';
import 'package:pet_care_mobile_apps/widgets/clinic_card_list.dart';
import 'package:provider/provider.dart';
import 'package:pet_care_mobile_apps/utils/result_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
  String query = '';

  @override
  void dispose() {
    super.dispose();

    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClinicSearchProvider>(
      create: (context) =>
          ClinicSearchProvider(apiService: ApiService(), query: query),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Consumer<ClinicSearchProvider>(
            builder: (context, provider, _) => TextField(
              controller: textEditingController,
              style: text11(
                weight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                hintText: 'Cari klinik atau layanan',
                hintStyle: text11(
                  weight: FontWeight.w400,
                  color: black50,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: black15,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: black15,
                    width: 1,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: otherColor50,
                ),
              ),
              cursorColor: mainColor,
              onSubmitted: (value) {
                provider.runSearch(value);
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                textEditingController.clear();
              },
              icon: Icon(
                Icons.close,
                color: otherColor,
              ),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Consumer<ClinicSearchProvider>(
          builder: (context, provider, _) {
            if (provider.state == ResultState.loading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: mainColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sedang mencari klinik',
                      style: text14(
                        weight: FontWeight.w500,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              );
            } else if (provider.state == ResultState.hasData) {
              return ListView.builder(
                itemCount: provider.result.data.length,
                itemBuilder: (context, index) {
                  final clinic = provider.result.data[index];
                  return ClinicCard(
                    clinicId: clinic.id,
                    clinicPoster: clinic.posterPath,
                    clinicName: clinic.name,
                    clinicAddress: clinic.address,
                    clinicDistance: clinic.distance,
                  );
                },
              );
            } else if (provider.state == ResultState.noData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.emoticonConfused,
                      size: 75,
                      color: mainColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Klinik yang Anda cari tidak ditemukan',
                      textAlign: TextAlign.center,
                      style: text14(
                        weight: FontWeight.w500,
                        color: mainColor,
                      ),
                    )
                  ],
                ),
              );
            } else if (provider.state == ResultState.error) {
              return Center(
                child: Text(
                  provider.message,
                  style: text14(
                    weight: FontWeight.w500,
                    color: mainColor,
                  ),
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.storeSearch,
                      size: 75,
                      color: mainColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cari klinik yang Anda inginkan',
                      textAlign: TextAlign.center,
                      style: text14(
                        weight: FontWeight.w500,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
