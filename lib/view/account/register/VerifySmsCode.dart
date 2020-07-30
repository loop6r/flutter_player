import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmsCodeVerify extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SmsCodeVerifyState();
  }
}

class _SmsCodeVerifyState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Container(
          child: Text("this is sms code verify"),
        ),
      ),
    );
  }
}
