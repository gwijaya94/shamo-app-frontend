import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProfileImageComponent extends StatelessWidget {
  const ProfileImageComponent({
    Key key,
    this.imgSize = 45,
    this.isOnline = false,
    this.isAsset = false,
    @required this.imgSource,
    this.onlineCheck = false,
    this.isCircle = true,
  }) : super(key: key);

  final String imgSource;
  final double imgSize;
  final bool isOnline, isAsset, onlineCheck, isCircle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: imgSize,
          width: imgSize,
          decoration: BoxDecoration(
            color: pureWhite,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : BorderRadius.circular(12),
          ),
        ),
        Container(
          height: imgSize,
          width: imgSize,
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: !isAsset ? NetworkImage(imgSource) : AssetImage(imgSource),
            ),
          ),
        ),
        if (onlineCheck || isOnline)
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: isOnline ? onlineColor : secondaryTextColor,
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: bgColor1),
            ),
          )
      ],
    );
  }
}
