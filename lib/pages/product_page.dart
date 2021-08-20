import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/components/status_bar.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> carouselItem = [dummyShoes, dummyShoes, dummyShoes];
  List<String> familiarShoes = [
    dummyShoes,
    dummyShoes,
    dummyShoes,
    dummyShoes,
    dummyShoes,
    dummyShoes,
    dummyShoes
  ];
  int currentIndex = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size mQuery = screenSize(context);
    String itemName = "COURT VISION 2.0 COURT VISION 2.0";
    String itemCategory = 'Hiking';
    String pricing = numberPrettier(20.30, true);
    String itemDesc =
        "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.";

    Widget carouselIndicator(int index) {
      bool isActive = currentIndex == index;
      return Container(
        width: isActive ? 20 : 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : secondaryTextColor,
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    Widget header() {
      List<Widget> carouselImg = [];
      List<Widget> cIndicator = [];

      for (int i = 0; i < carouselItem.length; i++) {
        cIndicator.add(carouselIndicator(i));
        carouselImg.add(
          Image.asset(
            carouselItem[i],
            width: mQuery.width,
            fit: BoxFit.cover,
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: carouselImg,
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => setState(() {
                    currentIndex = index;
                  }),
                ),
              ),
              Container(
                height: appBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(color: primaryColor),
                    IconComponent(
                      iconName: 'cart',
                      margin: EdgeInsets.symmetric(horizontal: defaultHPadding),
                      onPressed: () => null,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cIndicator),
        ],
      );
    }

    Widget addCart() {
      return Container(
        height: 45,
        padding: EdgeInsets.symmetric(
          horizontal: defaultHPadding,
        ),
        child: Row(
          children: [
            IconComponent(
              size: 45,
              iconSize: 24,
              isFilled: true,
              iconName: 'chat',
              iconColor: primaryColor,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {},
            ),
            SizedBox(width: 10),
            Expanded(
              child: ButtonComponent(
                buttonText: "Add to Cart",
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      List<Widget> listFamiliarShoes = [];
      for (int i = 0; i < familiarShoes.length; i++) {
        listFamiliarShoes.add(GestureDetector(
          onTap: () {},
          child: ProfileImageComponent(
            imgSource: familiarShoes[i],
            isAsset: true,
            isCircle: false,
            imgSize: 70,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
        ));
      }

      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: defaultVPadding),
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultHPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemName,
                          style: headline6,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          itemCategory,
                          style: subtitle1.merge(secondaryTextStyle),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  IconComponent(
                    iconName: 'heart',
                    size: 40,
                    iconSize: 24,
                    isFilled: true,
                    isCircle: true,
                    color: isFavorite ? secondaryColor : bottomIconColor,
                    iconColor: isFavorite ? pureWhite : bgColor1,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // NOTE: pricing
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: defaultHPadding,
              ),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price starts from", style: subtitle1),
                  Text(
                    pricing,
                    style: subtitle1
                        .merge(priceTextStyle)
                        .merge(semiBoldWeightStyle),
                  ),
                ],
              ),
            ),
            // NOTE: Description
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: defaultHPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: subtitle1.merge(mediumWeightStyle),
                  ),
                  SizedBox(height: 10),
                  Text(
                    itemDesc,
                    style: subtitle1
                        .merge(secondaryTextStyle)
                        .merge(lightWeightStyle),
                  ),
                ],
              ),
            ),
            // NOTE: Other Shoes
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: defaultHPadding,
                vertical: 10,
              ),
              child: Text(
                "Familiar Shoes",
                style: subtitle1.merge(mediumWeightStyle),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: defaultHPadding - 8),
              scrollDirection: Axis.horizontal,
              child: Row(children: listFamiliarShoes),
            ),
            SizedBox(height: 20),
            addCart()
          ],
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: bgColor6,
      body: StatusBarComponent(
        statusbar: SystemUiOverlayStyle.dark,
        child: CustomScrollViewComponent(
          verticalPadding: 0,
          horizontalPadding: 0,
          children: [
            header(),
            Expanded(
              child: content(),
            ),
          ],
        ),
      ),
    );
  }
}
