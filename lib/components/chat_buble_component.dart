import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ChatBubbleComponent extends StatelessWidget {
  const ChatBubbleComponent({
    Key key,
    @required this.isMe,
    @required this.message,
    this.sameWithNext = false,
  }) : super(key: key);

  final bool isMe, sameWithNext;
  final String message;

  @override
  Widget build(BuildContext context) {
    Radius bRadius = Radius.circular(15);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 220),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isMe ? bgColor5 : bgColor4,
          borderRadius: BorderRadius.only(
            topRight: (isMe && !sameWithNext) ? Radius.zero : bRadius,
            topLeft: !isMe && !sameWithNext ? Radius.zero : bRadius,
            bottomLeft: bRadius,
            bottomRight: bRadius,
          ),
        ),
        child: Text(message, style: bodyText2),
      ),
    );
  }
}
