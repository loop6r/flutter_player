import 'package:flutter/cupertino.dart';
import 'package:flutter_bridge/view/mine/itemview/MineHeaderView.dart';
import 'package:flutter_bridge/view/mine/itemview/MineLabelView.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State {
  @override
  Widget build(BuildContext context) {
//    if (true) {
//      return Text("page");
//    }
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            MineHeaderView(),
            _space(),
            MineLabelView(),
            MineLabelView(),
          ],
        ),
        Align(
          child: _bottomButton(),
          alignment: Alignment.bottomCenter,
        )
      ],
    );
  }

  Widget _space() {
    return Container(
      width: double.infinity,
      height: 12,
    );
  }

  Widget _bottomButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF4E75F2), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      width: double.infinity,
      height: 44,
    );
  }
}
