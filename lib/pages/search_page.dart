import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        title: TextField(
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
          onSubmitted: (value) {},
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
      ),
    );
  }
}
