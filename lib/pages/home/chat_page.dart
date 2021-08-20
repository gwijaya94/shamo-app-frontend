import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> chats = ["20", "30"];

    Widget emptyChat() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconComponent(
            iconName: 'face-agent',
            color: secondaryColor,
            size: 96,
          ),
          SizedBox(height: 15),
          Text(
            'Opss no message yet?',
            style: subtitle1.copyWith(fontWeight: medium),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'You have never done a transaction',
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
      );
    }

    Widget contentChat() {
      List<Widget> tempList = [];
      for (int i = 0; i < chats.length; i++) {
        tempList.add(
          ChatTile(
            shopImage:
                'https://cdn.iconscout.com/icon/free/png-256/nike-3215456-2673874.png',
            shopName: "Nike Official Store",
            message: "Good night, Is this item still available for sale?",
            time: 'Now',
            onTap: () => nextScreen(context, '/detail-chat'),
          ),
        );
      }

      return ListView(
        padding: EdgeInsets.only(
          left: defaultHPadding,
          right: defaultHPadding,
          bottom: 20,
        ),
        children: tempList,
      );
    }

    return SafeArea(
      child: (chats.length > 1) ? contentChat() : emptyChat(),
    );
  }
}
