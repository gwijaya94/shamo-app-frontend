import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shamo_frontend/utils/styling.dart';

Widget myIcon(
    {String iconName, double size, Color color, Function() onPressed}) {
  iconName = iconName ?? 'star';
  if (onPressed != null) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        MdiIcons.fromString(iconName),
        size: size ?? 24,
        color: color ?? primaryColor,
      ),
    );
  }
  return Icon(
    MdiIcons.fromString(iconName),
    size: size ?? 24,
    color: color ?? primaryColor,
  );
}

void nextScreen(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

void prevScreen(BuildContext context) {
  Navigator.pop(context);
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
