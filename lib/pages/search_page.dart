import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/main.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     textEditingController.clear();
        //   },
        //   icon: Icon(
        //     Icons.close,
        //     color: otherColor,
        //   ),
        // ),
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: black15,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: textEditingController,
            style: text11(
              weight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Cari klinik atau layanan',
              hintStyle: text11(
                weight: FontWeight.w400,
                color: black50,
              ),
              focusedBorder: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: otherColor50,
              ),
            ),
            cursorColor: mainColor,
            onSubmitted: (value) {},
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: otherColor,
            ),
          ),
        ],
      ),
    );
  }
}