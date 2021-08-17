import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
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
    String pricing = numberPrettier(price, true);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultHPadding),
        margin: EdgeInsets.symmetric(vertical: defaultGap * 2),
        // decoration: BoxDecoration(color: primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage(dummyShoes), width: 100),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(category, style: subtitle2.merge(secondaryTextStyle)),
                  Text(
                    productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: subtitle1.copyWith(fontWeight: semiBold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    pricing,
                    style: subtitle1
                        .merge(priceTextStyle)
                        .copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
