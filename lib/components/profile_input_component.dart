import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProfileInputComponent extends StatelessWidget {
  const ProfileInputComponent({
    Key key,
    this.labelText,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  final String labelText;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: subtitle1.merge(secondaryTextStyle)),
        TextField(
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          style: subtitle1,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: subtitleTextColor),
            ),
            fillColor: bgColor3,
            filled: true,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
