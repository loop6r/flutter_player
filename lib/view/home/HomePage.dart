import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bridge/style.dart';
import 'package:flutter_bridge/widget/Toolbar.dart';

import 'itemview/HomeBannerView.dart';
import 'itemview/HomeSectionView.dart';
import 'itemview/SpaceView.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  List data = List();

  @override
  void initState() {
    super.initState();
    data
      ..clear()
      ..add(SpaceItem(8))
      ..add(BannerItem())
      ..add(SpaceItem(16))
      ..add(SectionItem(label: "这是标题1", items: [
        SectionSubItem(title: "sub1", router: "/xxx/router1"),
        SectionSubItem(title: "sub2", router: "/xxx/router1"),
        SectionSubItem(title: "sub3", router: "/xxx/router1"),
        SectionSubItem(title: "sub4", router: "/xxx/router1"),
      ]))
      ..add(SpaceItem(12))
      ..add(SectionItem(label: "这是标题2", items: [
        SectionSubItem(title: "sub1", router: "/xxx/router1"),
        SectionSubItem(title: "sub2", router: "/xxx/router1"),
      ]))
      ..add(SpaceItem(8))
//      ..add(BottomItem())
      ..add(SpaceItem(8));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _toolbar(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              itemBuilder: _listViewBuilder,
              itemCount: data.length,
            ),
          ),
        )
      ],
    );
  }

  Widget _listViewBuilder(BuildContext ctx, int pos) {
    var item = data[pos];
    if (item is BannerItem) {
      return HomePageBanner();
    } else if (item is SectionItem) {
      return HomeSectionView(item: item);
    } else if (item is BottomItem) {
      return HomePageBanner();
    } else if (item is SpaceItem) {
      return SpaceView(spHeight: item.h);
    } else {
      return HomePageBanner();
    }
  }

  Widget _toolbar() {
    return Container(
      color: Colors.red,
      width: double.infinity,
      child: SafeArea(
        child: Container(
          height: 44,
          child: Center(
            child: Text(
              "标题",
              style: TextStyle(fontSize: 16, color: Color(Style.f222)),
            ),
          ),
        ),
      ),
    );
  }
}

class BannerItem {}

class SectionItem {
  final String label;
  final List<SectionSubItem> items;

  SectionItem({this.label, this.items});
}

class SectionSubItem {
  final String title;
  final String router;

  SectionSubItem({this.title, this.router});
}

class BottomItem {}

class SpaceItem {
  double h;

  SpaceItem(this.h);
}
