import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputState();
  }
}

class _InputState extends State {
  bool canSubmit = false;

  List<ItemVO> data = List();

  @override
  void initState() {
    super.initState();

    setState(() {
      for (int i = 0; i < 20; i++) {
        data.add(ItemVO(false, i));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: SafeArea(child: _getTitle()),
          preferredSize: Size(double.infinity, 50)),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(flex: 1, child: _getList()),
          _bottomBar(),
        ],
      ),
    );
  }

  Widget _getList() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        ItemVO vo = data[index];
        return ItemView(
          name: "name",
          label: "label",
          isSelect: false,
          code: "code",
        );
      },
      itemCount: data.length,
    );
  }

  Widget _getTitle() {
    return Container(
      width: double.infinity,
      height: 50,
      child: Text(
        "列表与普通布局",
        style: TextStyle(fontSize: 20, color: Color(0xFF212121)),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      width: double.infinity,
      height: 45,
      color: Color(0xFF3876EE),
      child: Center(
        child: Text("下一步", style: TextStyle(fontSize: 17, color: Colors.white)),
      ),
    );
  }
}

class ItemVO {
  final bool isSelect;
  final int id;

  ItemVO(this.isSelect, this.id);
}

class ItemView extends StatelessWidget {
  final String name;
  final String label;
  final bool isSelect;
  final String code;

  const ItemView({
    Key key,
    this.name,
    this.label,
    this.isSelect,
    this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print('你点你🐎呢');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 12),
            child: Image.asset(
              Res.icon_check_keybind_act,
              width: 24,
              height: 24,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 16, top: 7, bottom: 7),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color(0x141b1b4e),
                blurRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "大标题1",
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 16,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Center(),
                    ),
                    Text(
                      "右侧文案",
                      style: TextStyle(color: Color(0xB31B1B4E), fontSize: 12),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12)),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Color(0x141B1B4E),
                ),
                Padding(padding: EdgeInsets.only(top: 11)),
                Row(
                  children: <Widget>[
                    Text(
                      "小标题",
                      style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 14),
                    ),
                    Container(
                      width: 1,
                      height: 14,
                      color: Color(0x1A1B1B4E),
                      margin: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    Text(
                      "子内容",
                      style: TextStyle(color: Color(0xFF595959), fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
