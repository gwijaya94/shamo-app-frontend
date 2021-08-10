import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      return nextScreen(context, '/sign-in');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: StatusBarComponent(
        child: Center(
          child: Container(
            height: 150,
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconLogo),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
