import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
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
          if (labelText != null) Text(labelText, style: subtitle1),
          if (labelText != null) SizedBox(height: 12),
          TextField(
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            style: subtitle1,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              prefixIcon:
                  iconName != null ? IconComponent(iconName: iconName) : null,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
