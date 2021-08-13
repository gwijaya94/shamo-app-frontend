import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
    this.shopImage,
    this.message = '',
    @required this.shopName,
    this.time = 'Now',
    this.onTap,
  }) : super(key: key);

  final String shopImage, shopName, message, time;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: subtitleTextColor,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImageComponent(
              imgSource: shopImage ?? defaultPic,
              imgSize: 45,
              isAsset: shopImage != null ? false : true,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
                    style: subtitle1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (message != '')
                    Text(
                      message,
                      style: bodyText2.merge(secondaryTextStyle),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Text(
              time,
              style: overline.merge(secondaryTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
