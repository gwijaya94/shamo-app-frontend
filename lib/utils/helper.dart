import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget myIcon({iconName = 'star', size = 24, color, onPressed}) {
  if (onPressed != null) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        MdiIcons.fromString(iconName),
        size: size,
        color: color,
      ),
    );
  }
  return Icon(
    MdiIcons.fromString(iconName),
    size: size,
    color: color,
  );
}

void nextScreen(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

void prevScreen(BuildContext context) {
  Navigator.pop(context);
}
