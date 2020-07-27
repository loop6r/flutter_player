import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: SafeArea(
          child: Row(
            children: <Widget>[
              Text(
                "font",
                style: TextStyle(color: Colors.black38, fontSize: 19),
              ),
              Flexible(
                child: Text(
                  "asdfaasdfsadfs",
                  style: TextStyle(),

                  maxLines: 1,
                ),
              ),
              Expanded(child: Text(""),
              flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
