import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cartItems = [20, 39];
    String totalPrice = numberPrettier(300, true);

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
            IconComponent(iconName: 'cart', size: 96, color: secondaryColor),
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
      return ListView.builder(
        itemCount: cartItems.length,
        padding: EdgeInsets.only(
          left: defaultHPadding,
          right: defaultHPadding,
          top: 15,
          bottom: 15,
        ),
        itemBuilder: (context, index) {
          // int data = index;
          return CartCard(
            itemUrl:
                'https://cdn.iconscout.com/icon/free/png-256/nike-3215456-2673874.png',
            itemName: 'Nike Air Series 2.0',
            itemPrice: 20.39,
          );
        },
      );
    }

    Widget customNavBar({Function() onPressed}) {
      onPressed = onPressed ?? () {};
      return LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.minHeight,
              ),
              margin: EdgeInsets.fromLTRB(
                defaultHPadding,
                0,
                defaultHPadding,
                defaultVPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: bgColor2,
              ),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  primary: bgColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: subtitle1.merge(mediumWeightStyle),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      totalPrice,
                      style: subtitle1
                          .merge(priceTextStyle)
                          .merge(semiBoldWeightStyle),
                    ),
                    IconComponent(
                      margin: EdgeInsets.only(left: 10),
                      iconName: isAndroid ? 'arrow-right' : 'chevron-right',
                      iconColor: priceColor,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: (cartItems.length < 1)
          ? null
          : customNavBar(onPressed: () => nextScreen(context, '/checkout')),
      body: SafeArea(
        child: (cartItems.length > 0) ? content() : emptyCart(),
      ),
    );
  }
}
