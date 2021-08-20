import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shamo_frontend/utils/utils.dart';

class IconComponent extends StatelessWidget {
  const IconComponent({
    Key key,
    @required this.iconName,
    this.decoration,
    this.color,
    this.iconColor,
    this.onPressed,
    this.isCircle = false,
    this.size = 24,
    this.iconSize,
    this.disabled = false,
    this.isFilled = false,
    this.radius,
    this.padding,
    this.margin,
  }) : super(key: key);

  final String iconName;
  final Decoration decoration;
  final double size, radius, iconSize;
  final Color color, iconColor;
  final Function() onPressed;
  final bool disabled, isFilled, isCircle;
  final EdgeInsetsGeometry padding, margin;

  @override
  Widget build(BuildContext context) {
    Color baseColor = color ?? primaryColor;
    if (disabled) {
      baseColor = secondaryTextColor;
    }

    Decoration boxDecoration = BoxDecoration(
      color: isFilled ? baseColor : null,
      shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: isCircle ? null : BorderRadius.circular(radius ?? size / 4),
    );

    if (true) {
      return Container(
        width: size,
        height: size,
        margin: margin,
        padding: padding,
        decoration: decoration ?? (isFilled ? boxDecoration : null),
        child: IconButton(
          onPressed: disabled ? null : onPressed,
          padding: EdgeInsets.zero,
          splashRadius: 12,
          disabledColor: iconColor ?? (isFilled ? pureWhite : baseColor),
          color: iconColor ?? (isFilled ? pureWhite : baseColor),
          icon: Icon(
            MdiIcons.fromString(iconName),
            size: iconSize ?? (isFilled ? size - 4 : size),
          ),
        ),
      );
    }
  }
}
