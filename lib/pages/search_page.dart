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
        title: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              hintText: 'Cari klinik atau layanan',
              hintStyle: text11(
                weight: FontWeight.w400,
                color: black50,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Colors.red),
          cursorColor: mainColor,
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}
