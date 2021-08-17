import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'Gilbert';
    String username = 'gwijaya94';

    Widget appbar() {
      return Container(
        color: bgColor1,
        padding: EdgeInsets.symmetric(
          horizontal: defaultHPadding,
          vertical: defaultVPadding,
        ),
        child: Row(
          children: [
            ProfileImageComponent(
              imgSource: defaultPic,
              isAsset: true,
              imgSize: 50,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name",
                    style: headline6.merge(semiBoldWeightStyle),
                  ),
                  Text(
                    "@$username",
                    style: bodyText2.merge(subtitleTextStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      List<String> sectionTitle = ["Account", "General"];
      List<List<String>> sectionSettings = [
        ["Edit Profile", "My Order"],
        ["Privacy & Policy", "Term of Service"]
      ];

      Widget menuItem({
        String item,
        TextStyle textStyle,
        Color iconColor,
        Function() onTap,
      }) {
        textStyle = textStyle ?? secondaryTextStyle;
        return GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              // myIcon(iconName: 'chevron-right', color: pureWhite),
              // SizedBox(width: 10),
              Text(item, style: bodyText1.merge(textStyle)),
              Spacer(),
              myIcon(iconName: 'chevron-right', color: iconColor)
            ],
          ),
        );
      }

      List<Widget> sectionChildWidget(int sectionIndex) {
        List<Widget> tempSection = [];
        for (int i = 0; i < sectionSettings[sectionIndex].length; i++) {
          String data = sectionSettings[sectionIndex][i];

          tempSection.add(menuItem(
            iconColor: secondaryTextColor,
            item: data,
            onTap: () {},
          ));
          tempSection.add(SizedBox(height: 10));
        }
        return tempSection;
      }

      List<Widget> sectionWidget() {
        List<Widget> tempSection = [];

        for (int i = 0; i < sectionTitle.length; i++) {
          tempSection.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sectionTitle[i], style: headline6),
              SizedBox(height: 5),
              ...sectionChildWidget(i),
              SizedBox(height: 15),
            ],
          ));
        }

        return tempSection;
      }

      return Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultHPadding,
            vertical: defaultVPadding,
          ),
          children: [
            ...sectionWidget(),
            menuItem(
              iconColor: alertColor,
              item: "Sign Out",
              textStyle: alertTextStyle,
              onTap: () {
                signOut(context);
              },
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          appbar(),
          content(),
        ],
      ),
    );
  }
}
