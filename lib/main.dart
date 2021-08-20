import 'package:flutter/material.dart';
import 'package:shamo_frontend/pages/pages.dart';
import 'package:shamo_frontend/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: primaryColor,
        // buttonColor: primaryColor,
        // scaffoldBackgroundColor: bgColor1,
        scaffoldBackgroundColor: bgColor3,
        inputDecorationTheme: inputTheme(),
        appBarTheme: appbarTheme(),
      ),
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfile(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => SuccessCheckoutPage(),
      },
    );
  }
}
