import 'package:flutter/material.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

void nextScreen(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

void prevScreen(BuildContext context) {
  Navigator.pop(context);
}

void resetScreenUntil(BuildContext context, String routeName) {
  Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
}

String numberPrettier(double value, [bool pricing = false]) {
  String text = value
      .toStringAsFixed(2)
      .replaceAll(RegExp('/\B(?=(\d{3})+(?!\d))/g'), ',');

  if (pricing == true) {
    text = 'USD $text';
  }

  return text;
}
