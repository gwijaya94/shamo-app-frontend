import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shamo_frontend/utils/styling.dart';

bool isAndroid = Platform.isAndroid;

Widget myIcon({iconName, size, color, onPressed}) {
  iconName = iconName ?? 'star';
  if (onPressed != null) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
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
