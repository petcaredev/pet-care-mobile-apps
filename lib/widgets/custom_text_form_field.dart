import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? validation;
  final bool obscureText;
  final int? maxLines;
  final String hintText;
  final Widget? suffix;
  final Color textColor;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    this.validation,
    this.obscureText = false,
    this.maxLines,
    this.suffix,
    this.textColor = Colors.black,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validation;
        }
        return null;
      },
      style: text13(
        weight: FontWeight.w400,
        color: widget.textColor,
      ),
      keyboardType: widget.textInputType,
      cursorColor: mainColor,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: black15,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: black15,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: errorColor,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: errorColor,
            width: 2,
          ),
        ),
        hintText: widget.hintText,
        hintMaxLines: 2,
        hintStyle: text13(
          weight: FontWeight.w400,
          color: black35,
        ),
        suffixIcon: widget.suffix,
      ),
    );
  }
}
