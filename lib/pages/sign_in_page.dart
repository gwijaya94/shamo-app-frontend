import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Login", style: primaryTextStyle),
          Text("Sign In to Continue", style: secondaryTextStyle),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              header(),
            ],
          ),
        ),
      ),
    );
  }
}
