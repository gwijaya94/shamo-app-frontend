import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String category = 'Hiking';
    String itemName =
        "COURT VISION 2.0 COURT VISION 2.0COURT VISION 2.0 COURT VISION 2.0";
    String price = numberPrettier(20.30, true);

    return Container(
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
                  itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: subtitle1.copyWith(fontWeight: semiBold),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: subtitle1
                      .merge(priceTextStyle)
                      .copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
