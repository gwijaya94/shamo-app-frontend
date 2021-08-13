import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo_frontend/utils/utils.dart';

InputDecorationTheme inputTheme() {
  return InputDecorationTheme(
    hintStyle: bodyText2.merge(subtitleTextStyle),
    contentPadding: EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 15,
    ),
    fillColor: bgColor2,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: bgColor2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: alertColor),
    ),
  );
}

AppBarTheme appbarTheme() {
  return AppBarTheme(
    backwardsCompatibility: false,
    backgroundColor: bgColor1,
    centerTitle: true,
    titleTextStyle: headline6,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
  );
}
