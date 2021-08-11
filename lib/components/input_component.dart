import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class InputForm extends StatelessWidget {
  final String labelText, iconName;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  const InputForm({
    Key key,
    this.controller,
    this.labelText,
    this.onChanged,
    this.iconName,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: subtitle1),
          SizedBox(height: 12),
          TextField(
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            style: subtitle1,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: iconName != null ? myIcon(iconName: iconName) : null,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
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
            ),
          ),
        ],
      ),
    );
  }
}
