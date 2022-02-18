import 'package:flutter/material.dart';

class Bank {
  Bank(
      {required this.name,
      required this.image,
      required this.color,
      required this.ussdCode,
      required this.listOfavailableBankUssdOps,
      required this.bankInfo});

  final String name, ussdCode, bankInfo, image;
  final List<dynamic> listOfavailableBankUssdOps;
  final Color color;
}
