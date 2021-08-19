import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo_frontend/components/components.dart';
import 'package:shamo_frontend/modals/modals.dart';
import 'package:shamo_frontend/pages/pages.dart';
import 'package:shamo_frontend/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentRoute = 0;

  @override
  Widget build(BuildContext context) {
    List<PageModal> bottomBarList = [
      PageModal(
        iconName: 'home',
        label: '',
        route: HomePage(),
      ),
      PageModal(
        iconName: 'chat-processing',
        label: '',
        route: ChatPage(),
      ),
      PageModal(
        iconName: 'blank',
        label: '',
        route: ChatPage(),
      ),
      PageModal(
        iconName: 'heart',
        label: '',
        route: WishlistPage(),
      ),
      PageModal(
        iconName: 'account',
        label: '',
        route: ProfilePage(),
      ),
    ];

    Widget cartFab() {
      return FloatingActionButton(
        onPressed: () => nextScreen(context, '/cart'),
        backgroundColor: secondaryColor,
        child: myIcon(iconName: 'shopping', color: pureWhite),
      );
    }

    Widget customBottomNav() {
      List<BottomNavigationBarItem> addRoute() {
        List<BottomNavigationBarItem> tempList = [];
        for (int i = 0; i < bottomBarList.length; i++) {
          tempList.add(
            BottomNavigationBarItem(
              icon: myIcon(
                iconName: bottomBarList[i].iconName,
                color: currentRoute == i ? primaryColor : bottomIconColor,
              ),
              label: bottomBarList[i].label,
            ),
          );
        }

        return tempList;
      }

      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: bgColor4,
            currentIndex: currentRoute,
            onTap: (value) => setState(() {
              if (value != 2) {
                return currentRoute = value;
              }
            }),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: addRoute(),
          ),
        ),
      );
    }

    Widget body() {
      return bottomBarList[currentRoute].route;
    }

    Widget appBar() {
      if (currentRoute == 0 || currentRoute == 4) {
        return null;
      }
      String title = 'Message Support';
      if (currentRoute == 3) {
        title = "Favorite Shoes";
      }

      return AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      );
    }

    return Scaffold(
      floatingActionButton: cartFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      appBar: appBar(),
      body: StatusBarComponent(
        statusbar: SystemUiOverlayStyle.light,
        child: body(),
      ),
    );
  }
}
