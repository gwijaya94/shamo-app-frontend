import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class WishlistCart extends StatelessWidget {
  const WishlistCart({
    Key key,
    @required this.itemUrl,
    @required this.itemName,
    @required this.itemPrice,
  }) : super(key: key);

  final String itemUrl;
  final String itemName;
  final double itemPrice;

  @override
  Widget build(BuildContext context) {
    String pricing = numberPrettier(itemPrice, true);

    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImageComponent(
            imgSource: itemUrl,
            isCircle: false,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: subtitle1.merge(semiBoldWeightStyle),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pricing,
                  style: subtitle1.merge(priceTextStyle),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor,
            ),
            child: myIcon(
              iconName: 'heart',
              color: pureWhite,
              size: 18,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
