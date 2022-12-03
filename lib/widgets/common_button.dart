import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class CommonButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  final BorderSide? borderSide;

  const CommonButton({
    super.key,
    this.textColor = Colors.black,
    this.borderSide,
    required this.onPressed,
    required this.buttonColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonColor),
        side: MaterialStatePropertyAll(borderSide),
        fixedSize: MaterialStatePropertyAll(
          Size(MediaQuery.of(context).size.width, 50),
        ),
        elevation: const MaterialStatePropertyAll(0),
      ),
      child: Text(
        buttonText,
        style: text14(
          weight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
