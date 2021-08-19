import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cartItems = [20, 39];

    Widget appBar() {
      return AppBar(
        title: Text("Your Cart"),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myIcon(iconName: 'cart', size: 96, color: secondaryColor),
            SizedBox(height: 15),
            Text(
              'Opss! Your cart is empty',
              style: subtitle1.merge(mediumWeightStyle),
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
                onPressed: () => resetScreenUntil(context, '/home'),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      List<Widget> tempList = [];
      for (int i = 0; i < cartItems.length; i++) {
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

    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: (cartItems.length > 0) ? content() : emptyCart(),
      ),
    );
  }
}
