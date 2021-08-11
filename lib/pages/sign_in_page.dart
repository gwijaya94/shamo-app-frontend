import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: headline5.copyWith(
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Sign In to Continue",
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
            "Don't have an account? ",
            style: button,
          ),
          GestureDetector(
            onTap: () => nextScreen(context, '/sign-up'),
            child: Text(
              "Sign Up",
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
          SizedBox(height: 70),
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
            onPressed: () => nextScreen(context, '/home'),
          ),
          SizedBox(height: 15),
          footer(),
        ],
      ),
    );
  }
}
