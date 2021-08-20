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
    String itemRefUrl =
        'https://cdn.iconscout.com/icon/free/png-256/nike-3215456-2673874.png';
    bool hasItemReference = true;
    String itemRefName = 'Nike Air Series 2.0';
    String itemRefPrice = numberPrettier(20.39, true);

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

    Widget productReview() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultHPadding, vertical: 10),
        padding: EdgeInsets.all(10),
        width: 220,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: primaryColor),
          color: primaryColor.withOpacity(0.15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: pureWhite),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(itemRefUrl)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    itemRefName,
                    style: subtitle1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    itemRefPrice,
                    style: subtitle2.merge(priceTextStyle),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: IconComponent(
                  iconName: 'close',
                  size: 20,
                  isFilled: true,
                  isCircle: true,
                  iconColor: bgColor1,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasItemReference) productReview(),
          Container(
            color: bgColor1,
            padding: EdgeInsets.symmetric(
              horizontal: defaultHPadding,
              vertical: 15,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 5,
                    minLines: 1,
                    onChanged: (value) => null,
                    style: bodyText2,
                    decoration: InputDecoration(hintText: "Your message..."),
                  ),
                ),
                IconComponent(
                  iconName: 'send',
                  isFilled: true,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10),
                  size: 48,
                  color: secondaryColor,
                  iconSize: 24,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          ChatBubbleComponent(
            isMe: true,
            message: "ini adalah sebuah pesan",
            sameWithNext: true,
          ),
          ChatBubbleComponent(
            isMe: true,
            message: "ini adalah sebuah pesan",
            sameWithNext: false,
          ),
          ChatBubbleComponent(
            isMe: false,
            message: "ini adalah sebuah pesan balasan",
            sameWithNext: false,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appbar(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
