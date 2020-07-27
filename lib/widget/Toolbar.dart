import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final double toolbarHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    debugPrint("statusbar he is ${padding.top}");
    return Container(
      color: Colors.red,
      height: double.infinity,
      child: child,
    );
  }

//
  Toolbar({double tbHeight, Widget child, BuildContext ctx})
      : toolbarHeight = tbHeight,
        child = child,
        preferredSize = Size(double.infinity, tbHeight),
        super();

  @override
  final Size preferredSize;

//  @override
//  final Size preferredSize= Size(double.infinity,toolbarHeight);
}
