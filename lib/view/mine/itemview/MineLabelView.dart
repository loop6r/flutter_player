import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bridge/style.dart';

class MineLabelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 58,
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 16)),
              Container(
                width: 24,
                height: 24,
                color: Colors.black12,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                "label",
                style: TextStyle(color: Color(Style.f222), fontSize: 16),
              )
            ],
          ),
        ),
        _divider(true)
      ],
    );
  }

  Widget _divider(bool showDivider) {
    if (!showDivider) return null;
    return Divider(
      indent: 16,
      height: 0.5,
      color: Color(0x33929497),
    );
  }
}
