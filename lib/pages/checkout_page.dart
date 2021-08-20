import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listItem = [10, 10];
    String storeName = 'Nike Store';
    String receiverAddress = 'Jl. Listrik Gg. Kontak kontak';
    double totalPrice = 0;
    int totalQty = 0;
    double shippingFee = 10.5;

    Widget appBar() {
      return AppBar(
        title: Text('Checkout'),
      );
    }

    Widget content() {
      List<Widget> tempList = [];
      for (int i = 0; i < listItem.length; i++) {
        int data = i;
        tempList.add(CheckoutItemCard(
          itemUrl:
              'https://cdn.iconscout.com/icon/free/png-256/nike-3215456-2673874.png',
          itemName: 'Nike Air Series 2.0',
          itemPrice: 20.39,
          qtyItem: 2,
        ));
        totalPrice = totalPrice + 20.39;
        totalQty = totalQty + 2;
      }

      Widget summaryDetail(String label, String value) {
        return Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: subtitle1.merge(secondaryTextStyle)),
              Text(value, style: subtitle1.merge(mediumWeightStyle)),
            ],
          ),
        );
      }

      return CustomScrollViewComponent(
        children: [
          //NOTE LIST ITEMM
          Text('List Items', style: headline6),
          ...tempList,
          SizedBox(height: 15),
          //NOTE LIST ITEMM
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: bgColor2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Address Details', style: headline6),
                SizedBox(height: 10),
                Text("From:", style: caption.merge(secondaryTextStyle)),
                Text(storeName, style: bodyText2),
                SizedBox(height: 5),
                Text("To:", style: caption.merge(secondaryTextStyle)),
                Text(receiverAddress, style: bodyText2),
              ],
            ),
          ),
          SizedBox(height: 20),
          //NOTE PAYMENT SUMMARY
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: bgColor2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Payment Summary', style: headline6),
                SizedBox(height: 10),
                summaryDetail(
                  "Total Items",
                  "$totalQty item${totalQty > 1 ? "s" : ''}",
                ),
                summaryDetail(
                  "Price",
                  "${numberPrettier(totalPrice, true)}",
                ),
                summaryDetail(
                  "Shipping Fee",
                  "${numberPrettier(shippingFee, true)}",
                ),
                Container(
                  height: 0.5,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  color: bottomIconColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grand Total",
                      style: subtitle1
                          .merge(priceTextStyle)
                          .merge(semiBoldWeightStyle),
                    ),
                    Text(
                      numberPrettier(totalPrice + shippingFee, true),
                      style: subtitle1
                          .merge(priceTextStyle)
                          .merge(semiBoldWeightStyle),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(height: 20),
          //NOTE CHECKOUT BUTTON
          ButtonComponent(
            buttonText: "Checkout Now",
            onPressed: () {
              resetScreenUntil(context, '/home');
              nextScreen(context, '/checkout-success');
            },
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: content(),
    );
  }
}
