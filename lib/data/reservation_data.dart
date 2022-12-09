import 'package:flutter/material.dart';

import 'account_data.dart';

DateTime? reservationDate;

List<bool> serviceChecked = [];
List<int> serviceSelected = [];

TextEditingController fullNameController =
    TextEditingController(text: fullName);
TextEditingController petNameController = TextEditingController();
TextEditingController petTypeController = TextEditingController();
TextEditingController optionalNoteController = TextEditingController();

enum PaymentMethod { cash, transfer }

PaymentMethod? paymentMethod;

class DummyService {
  final String serviceName;
  final double servicePrice;
  late bool isChecked;

  DummyService({
    required this.serviceName,
    required this.servicePrice,
    required this.isChecked,
  });
}

var serviceList = [
  DummyService(
    serviceName: 'Grooming Sehat',
    servicePrice: 35000,
    isChecked: false,
  ),
  DummyService(
    serviceName: 'Grooming Kering',
    servicePrice: 25000,
    isChecked: false,
  ),
  DummyService(
    serviceName: 'Trimming',
    servicePrice: 15000,
    isChecked: false,
  ),
];
