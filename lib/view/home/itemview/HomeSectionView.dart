import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bridge/style.dart';
import 'package:flutter_bridge/view/home/HomePage.dart';

import 'SliverGridDelegateWithFixedCrossAxisCountHeight.dart';

class HomeSectionView extends StatelessWidget {
  final SectionItem item;

  HomeSectionView({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTitle(),
          Padding(
            padding: EdgeInsets.only(top: 12),
          ),
          createShadowContainer(_getSubItems()),
        ],
      ),
    );
  }

  Widget _getTitle() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: Container(
            width: 72,
            height: 10,
            color: Color(0x14CC000B),
          ),
        ),
        Text(
          item.label,
          style: TextStyle(fontSize: 18, color: Color(Style.f222)),
        )
      ],
    );
  }

  Widget _getSubItems() {
    return Container(
      color: Colors.black12,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: TestSliverGrid(
          crossAxisCount: 2,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5,
          fixedChildHeight: 80,
        ),
        itemBuilder: _subItemBuilder,
        itemCount: item.items.length,
      ),
    );
  }

  Widget createShadowContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x73E6E6E6),
            blurRadius: 4,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: child,
    );
  }

  Widget _subItemBuilder(BuildContext ctx, int pos) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 6),
            width: 60,
            height: 60,
            color: Colors.black12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6),
          ),
          Text(
            "${(item.items[pos] as SectionSubItem).title}",
            style: TextStyle(
              color: Color(Style.f222),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
