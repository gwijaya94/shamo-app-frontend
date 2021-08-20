import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ButtonComponent extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final String buttonType;
  const ButtonComponent(
      {Key key, this.buttonText, this.onPressed, this.buttonType = 'primary'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText, style: subtitle2),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        primary: buttonType != 'secondary' ? primaryColor : bgColor2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        // onPrimary: Colors.white,
        // onSurface: Colors.grey,
      ),
    );
  }
}
