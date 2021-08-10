import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class StatusBarComponent extends StatelessWidget {
  Widget child;
  SystemUiOverlayStyle statusbar;
  StatusBarComponent({this.child, this.statusbar = SystemUiOverlayStyle.light});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusbar,
      child: child,
    );
  }
}
