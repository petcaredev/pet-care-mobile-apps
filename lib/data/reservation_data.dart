import 'package:flutter/material.dart';

import 'account_data.dart';

DateTime? reservationDate;

TextEditingController fullNameController =
    TextEditingController(text: fullName);
TextEditingController petNameController = TextEditingController();
TextEditingController petTypeController = TextEditingController();
TextEditingController optionalNoteController = TextEditingController();

enum PaymentMethod { cash, transfer }

PaymentMethod? paymentMethod;

class Service {
  final String serviceName;
  final int servicePrice;
  late bool isChecked;

  Service({
    required this.serviceName,
    required this.servicePrice,
    required this.isChecked,
  });
}

var serviceList = [
  Service(
    serviceName: 'Grooming Sehat',
    servicePrice: 35000,
    isChecked: false,
  ),
  Service(
    serviceName: 'Grooming Kering',
    servicePrice: 25000,
    isChecked: false,
  ),
  Service(
    serviceName: 'Trimming',
    servicePrice: 15000,
    isChecked: false,
  ),
];
