import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/pages/done_page.dart';
import 'package:pet_care_mobile_apps/pages/process_page.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Riwayat',
            style: text13(weight: FontWeight.w400),
          ),
          bottom: TabBar(
            labelColor: mainColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: mainColor,
            tabs: const [
              Tab(
                text: 'Proses',
              ),
              Tab(
                text: 'Selesai',
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: const TabBarView(children: [ProcessPage(), DonePage()]),
      ),
    );
  }
}
