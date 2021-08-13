import 'dart:io';

bool isAndroid = Platform.isAndroid;

bool isIphoneX = false;
bool isIphone12 = false;
double statusBarIOS = isIphoneX
    ? 44
    : isIphone12
        ? 47
        : 20;

double statusBarHeight = isAndroid ? 24 : statusBarIOS;
double appBarHeight = isAndroid ? 56 : 44;
