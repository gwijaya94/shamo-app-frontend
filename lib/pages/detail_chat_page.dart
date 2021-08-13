import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isShopOnline = false;
    String shopImage =
        'https://cdn.iconscout.com/icon/free/png-256/nike-3215456-2673874.png';
    double shopImgSize = 45;
    String shopName = "Nike Official Store";

    Widget appbar() {
      return AppBar(
        toolbarHeight: 70,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileImageComponent(
              imgSource: shopImage,
              isOnline: isShopOnline,
              imgSize: shopImgSize,
              onlineCheck: true,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
                    style: subtitle1.merge(mediumWeightStyle),
                  ),
                  if (isShopOnline)
                    Text(
                      "Online",
                      style: bodyText2
                          .merge(lightWeightStyle)
                          .merge(secondaryTextStyle),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appbar(),
      body: Center(
        child: Text(
          "ini text",
          style: headline6,
        ),
      ),
    );
  }
}
