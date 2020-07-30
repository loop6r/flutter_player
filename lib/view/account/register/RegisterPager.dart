import 'package:flutter/cupertino.dart';
import 'package:flutter_bridge/view/account/register/Register.dart';
import 'package:flutter_bridge/view/account/register/VerifySmsCode.dart';
import 'package:flutter_bridge/view/account/register/state/state.dart';
import 'package:provider/provider.dart';

class RegisterPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PagerState();
  }
}

class PagerState extends State with ChangeNotifier {
  PageController pageCtrl;

  @override
  void initState() {
    super.initState();
    pageCtrl = PageController(initialPage: 0);
    context.read<RegisterPageModel>().addListener(() {
      var tempPage = context.read<RegisterPageModel>().current;
      pageCtrl.jumpToPage(tempPage);
      debugPrint("current ${context.read<RegisterPageModel>().current}");
    });
  }

  @override
  Widget build(BuildContext context) {
//    return Consumer<RegisterPageModel>(builder: (ctx, data, child) {
//      return _getPage(context, data.current);
//    });
    return _getChild();
  }

  Widget _getChild() {
    return PageView.builder(
      itemBuilder: _getPage,
      itemCount: 2,
      controller: pageCtrl,
    );
  }

  Widget _getPage(BuildContext ctx, int index) {
    Widget target;
    debugPrint("_getPage $index");
    switch (index) {
      case 0:
        {
          target = RegisterPage();
        }
        break;
      case 1:
        {
          target = SmsCodeVerify();
        }
        break;
    }
    debugPrint("log heheh");

    return target;
  }
}
