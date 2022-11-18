import 'package:flutter/material.dart';
import 'package:pet_care_mobile_apps/styles/styles.dart';

class ReservationCheckBox extends StatefulWidget {
  bool value;
  String serviceName;
  int servicePrice;

  ReservationCheckBox({
    super.key,
    required this.serviceName,
    required this.servicePrice,
    required this.value,
  });

  @override
  State<ReservationCheckBox> createState() => _ReservationCheckBoxState();
}

class _ReservationCheckBoxState extends State<ReservationCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.serviceName,
        style: text13(
          weight: FontWeight.w400,
          color: subColor85,
        ),
      ),
      secondary: Text(
        'Rp ${widget.servicePrice}',
        style: text13(
          weight: FontWeight.w400,
          color: subColor85,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: mainColor,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      value: widget.value,
      onChanged: (value) {
        setState(() {
          widget.value = value!;
        });
      },
    );
  }
}
