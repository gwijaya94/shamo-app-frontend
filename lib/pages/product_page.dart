import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo_frontend/components/status_bar.dart';
import 'package:shamo_frontend/utils/utils.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> carouselItem = [dummyShoes, dummyShoes, dummyShoes];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size mQuery = screenSize(context);

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
                    myIcon(
                      iconName: 'cart',
                      color: primaryColor,
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

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultHPadding,
          vertical: defaultVPadding,
        ),
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: bgColor6,
      body: StatusBarComponent(
        statusbar: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: ListView(
            children: [
              header(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
