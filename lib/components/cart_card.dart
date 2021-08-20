import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key key,
    @required this.itemUrl,
    @required this.itemName,
    @required this.itemPrice,
  }) : super(key: key);

  final String itemUrl;
  final String itemName;
  final double itemPrice;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int itemQty = 1;

  @override
  Widget build(BuildContext context) {
    String itemUrl = widget.itemUrl;
    String itemName = widget.itemName;
    double itemPrice = widget.itemPrice;
    String pricing = numberPrettier(itemPrice, true);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileImageComponent(
            imgSource: itemUrl,
            isCircle: false,
            imgSize: 60,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  itemName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: subtitle1.merge(semiBoldWeightStyle),
                ),
                Text(pricing, style: bodyText2.merge(priceTextStyle)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconComponent(
                            iconName: 'delete',
                            color: alertColor,
                            size: 20,
                            onPressed: () {},
                          ),
                          SizedBox(width: 10),
                          IconComponent(
                            iconName: 'minus',
                            disabled: itemQty <= 1,
                            size: 20,
                            isFilled: true,
                            isCircle: true,
                            onPressed: () {
                              setState(() {
                                itemQty--;
                              });
                            },
                          ),
                          Text(
                            itemQty.toString(),
                            style: subtitle1,
                          ),
                          IconComponent(
                            iconName: 'plus',
                            size: 20,
                            isFilled: true,
                            isCircle: true,
                            disabled: itemQty >= 10,
                            onPressed: () {
                              setState(() {
                                itemQty++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
