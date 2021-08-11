import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: headline5.copyWith(
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Register and Happy Shoping",
              style: bodyText2.merge(
                subtitleTextStyle,
              ),
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: button,
          ),
          GestureDetector(
            onTap: () => prevScreen(context),
            child: Text(
              "Sign In",
              style: button.merge(purlpeTextStyle),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: CustomScrollViewComponent(
        children: [
          header(),
          SizedBox(height: 50),
          InputForm(
            iconName: 'account-circle',
            labelText: "Full Name",
          ),
          InputForm(
            iconName: 'at',
            labelText: "Username",
          ),
          InputForm(
            iconName: 'email',
            labelText: "Email Address",
            keyboardType: TextInputType.emailAddress,
          ),
          InputForm(
            iconName: 'lock',
            labelText: "Password",
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(height: 10),
          Spacer(),
          ButtonComponent(
            buttonText: "Sign In",
            onPressed: () => null,
          ),
          SizedBox(height: 15),
          footer(),
        ],
      ),
    );
  }
}
