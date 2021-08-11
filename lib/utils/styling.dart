import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color parseColor(var hexColor) {
  var intColor = '0xff' + hexColor;
  return Color(int.parse(intColor));
}

double defaultMargin = 30;

Color primaryColor = Color(0xff6C5ECF);
Color secondaryColor = Color(0xff38ABBE);
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color bgColor1 = Color(0xff1F1D2B);
Color bgColor2 = Color(0xff2B2937);
Color bgColor3 = Color(0xff242231);
Color primaryTextColor = Color(0xffF1F0F2);
Color secondaryTextColor = Color(0xff999999);
Color subtitleTextColor = Color(0xff504F5E);

Color pureWhite = Color(0xFFFFFFFF);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);
TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);
TextStyle priceTextStyle = GoogleFonts.poppins(
  color: priceColor,
);
TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleTextColor,
);
TextStyle purlpeTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);
