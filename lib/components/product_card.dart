import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.category,
    @required this.productName,
    @required this.price,
    @required this.onTap,
  }) : super(key: key);

  final String category, productName;
  final double price;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    String pricing = numberPrettier(20.30, true);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: defaultGap * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: prodCardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image(image: AssetImage(dummyShoes)),
            ),
            Text(category, style: subtitle2.merge(secondaryTextStyle)),
            Text(
              productName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: headline6.copyWith(
                color: bgColor3,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 5),
            Text(pricing, style: subtitle2.merge(priceTextStyle)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
