import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "this is a empty page",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
