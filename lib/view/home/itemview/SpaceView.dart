import 'package:flutter/cupertino.dart';

class SpaceView extends StatelessWidget {
  final double spHeight;

  SpaceView({this.spHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spHeight,
      width: double.infinity,
    );
  }
}
