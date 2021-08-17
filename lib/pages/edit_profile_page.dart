import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return AppBar(
        title: Text("Edit Profile"),
        leading: myIcon(
          iconName: 'close',
          color: pureWhite,
          onPressed: () => prevScreen(context),
        ),
        actions: [
          myIcon(iconName: 'check', onPressed: () => null),
          SizedBox(width: defaultHPadding),
        ],
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultHPadding,
          vertical: defaultVPadding,
        ),
        children: [
          Align(
            alignment: Alignment.center,
            child: ProfileImageComponent(
              isAsset: true,
              imgSize: 100,
              imgSource: defaultPic,
            ),
          ),
          SizedBox(height: 30),
          ProfileInputComponent(
            labelText: "Name",
            onChanged: (value) {},
          ),
          ProfileInputComponent(
            labelText: "Username",
            onChanged: (value) {},
          ),
          ProfileInputComponent(
            labelText: "Email",
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: content(),
      ),
    );
  }
}
