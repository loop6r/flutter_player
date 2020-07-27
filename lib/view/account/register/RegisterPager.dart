import 'package:flutter/cupertino.dart';
import 'package:flutter_bridge/view/account/register/Register.dart';
import 'package:flutter_bridge/view/account/register/VerifySmsCode.dart';

class RegisterPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PagerState();
  }
}

class _PagerState extends State {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: _getPage,
      itemCount: 2,
    );
  }

  Widget _getPage(BuildContext ctx, int index) {
    Widget target;
    switch (index) {
      case 0:
        {
          return RegisterPage();
        }
        break;
      case 1:
        {
          return SmsCodeVerify();
        }
        break;
    }

    return target;
  }
}
