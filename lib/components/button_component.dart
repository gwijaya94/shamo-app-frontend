import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ButtonComponent extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  const ButtonComponent({Key key, this.buttonText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        // onPrimary: Colors.white,
        // onSurface: Colors.grey,
      ),
    );
  }
}
