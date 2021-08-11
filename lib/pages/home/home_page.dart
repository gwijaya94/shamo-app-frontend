import 'package:flutter/material.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'Gilbert';
    String username = 'gwijaya94';
    int selectedCategoryIndex = 0;

    List<String> listCategories = [
      'All Shoes',
      "Sports",
      "Training",
      'Basketball',
      'Hiking'
    ];
    List<Map<String, dynamic>> prodList = [
      {"id": '01'},
      {'id': '02'}
    ];

    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultHPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, $name",
                    style: headline5.copyWith(fontWeight: semiBold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "@$username",
                    style: bodyText1.merge(subtitleTextStyle),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(defaultPic),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget categories() {
      List<Widget> tempList = [];
      for (int i = 0; i < listCategories.length; i++) {
        bool isSelected = i == selectedCategoryIndex;
        Color borderColor = isSelected ? primaryColor : subtitleTextColor;
        Color buttonBgColor = isSelected ? primaryColor : transparentColor;
        TextStyle textStyle =
            isSelected ? subtitle2 : subtitle2.merge(subtitleTextStyle);

        Widget categoryWidget = Container(
          margin: EdgeInsets.symmetric(horizontal: defaultGap),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: buttonBgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Text(listCategories[i], style: textStyle),
        );

        tempList.add(categoryWidget);
      }

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultHPadding - defaultGap),
        scrollDirection: Axis.horizontal,
        child: Row(children: tempList),
      );
    }

    Widget popularProducts() {
      List<Widget> tempProdList = [];
      for (int i = 0; i < prodList.length; i++) {
        Widget data = ProductCard();
        tempProdList.add(data);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: defaultHPadding,
            ),
            child: Text(
              'Popular Products',
              style: headline5.copyWith(fontWeight: semiBold),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: defaultHPadding - 2 * defaultGap),
            scrollDirection: Axis.horizontal,
            child: Row(children: tempProdList),
          ),
        ],
      );
    }

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: defaultVPadding),
        children: [
          header(),
          SizedBox(height: defaultMargin),
          categories(),
          SizedBox(height: defaultMargin - 15),
          popularProducts(),
        ],
      ),
    );
  }
}
