import 'package:flutter/material.dart';
import 'package:shamo_frontend/utils/utils.dart';

class CustomScrollViewComponent extends StatelessWidget {
  final List<Widget> children;
  final double horizontalPadding, verticalPadding;
  const CustomScrollViewComponent({
    Key key,
    this.children,
    this.horizontalPadding,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double vPadding = verticalPadding ?? defaultMargin;
        double hPadding = horizontalPadding ?? defaultMargin;
        double minHeightBox = constraints.maxHeight - 2 * (vPadding);
        minHeightBox = minHeightBox - statusBarHeight;

        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
                vertical: vPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: minHeightBox,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
