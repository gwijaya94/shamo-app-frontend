import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List wishlistList = ["tees", "tes"];

    Widget emptyContent() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myIcon(
            iconName: 'heart',
            color: secondaryColor,
            size: 96,
          ),
          SizedBox(height: 15),
          Text(
            "You don't have dream shoes?",
            style: subtitle1.copyWith(fontWeight: medium),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Let's find your favorite shoes",
            style: bodyText2.merge(secondaryTextStyle),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: ButtonComponent(
              buttonText: "Explore Store",
              onPressed: () => null,
            ),
          ),
        ],
      );
    }

    Widget wishlistContent() {
      List<Widget> tempList = [];

      for (int i = 0; i < wishlistList.length; i++) {
        tempList.add(WishlistCart(
          itemUrl:
              'https://cdn.iconscout.com/icon/free/png-256/nike-3215456-2673874.png',
          itemName: 'Nike Air Series 2.0',
          itemPrice: 20.39,
        ));
      }

      return ListView(
        padding: EdgeInsets.only(
          left: defaultHPadding,
          right: defaultHPadding,
          top: 15,
          bottom: 15,
        ),
        children: tempList,
      );
    }

    return SafeArea(
      child: (wishlistList.length > 0) ? wishlistContent() : emptyContent(),
    );
  }
}
