import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class CommonContainer extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  CommonContainer({
    super.key,
    required this.title,
    required this.widgets,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: black15,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: text13(
              weight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 7),
            color: black10,
          ),
          Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: widgets,
          ),
        ],
      ),
    );
  }
}
