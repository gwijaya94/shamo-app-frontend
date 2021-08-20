import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/styling.dart';
import 'package:shamo_frontend/utils/utils.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context);
    Widget appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Text("Thank You"),
      );
    }

    return Scaffold(
      // appBar: appBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconComponent(
                iconName: 'check-decagram',
                color: secondaryColor,
                size: 96,
              ),
              SizedBox(height: 15),
              Text(
                "You have made a transaction!",
                style: subtitle1.merge(mediumWeightStyle),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Stay at home while we\nprepare your dream shoes",
                style: bodyText2.merge(secondaryTextStyle),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ButtonComponent(
                      buttonText: "Check Other Shoes",
                      onPressed: () => resetScreenUntil(context, '/home'),
                    ),
                    SizedBox(height: 10),
                    ButtonComponent(
                      buttonText: "View My Order",
                      buttonType: 'secondary',
                      onPressed: () => null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
