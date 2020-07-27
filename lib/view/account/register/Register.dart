import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bridge/res.dart';
import 'package:flutter_bridge/widget/CommonButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * 注册界面
 */
class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State {
  var isAgree = false;
  var isValidPhone = false;

  bool canSubmit() {
    return isAgree && isValidPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            color: Colors.red,
            child: SafeArea(
              child: Container(),
            ),
          ),
          preferredSize: Size(double.infinity, 55)),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _topTitle(),
            _space(50),
            _input(),
            _license(),
            _space(26),
            _submitBtn(canSubmit()),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    inputCtrl = TextEditingController();
  }

  Widget _topTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hi！请注册",
          style: TextStyle(
              fontSize: 24,
              color: Color(0xFF222222),
              fontWeight: FontWeight.w600),
        ),
        _space(4),
        Text(
          "注册账户以便获取更多服务",
          style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
        ),
      ],
    );
  }

  Widget _space(int height) {
    return Container(
      width: double.infinity,
      height: height.toDouble(),
    );
  }

  TextEditingController inputCtrl;

  Widget _input() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "+86",
              style: TextStyle(color: Color(0xFF222222), fontSize: 16),
            ),
            Expanded(
              child: TextField(
                onChanged: _onInputChange,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(bottom: 13, top: 13, left: 10),
                    hintText: "this is hint",
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Color(0xFFDDDDDD),
        ),
      ],
    );
  }

  Widget _license() {
    return Row(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() {
              isAgree = !isAgree;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
            child: Image.asset(
              isAgree ? Res.icon_license_checked : Res.icon_license_uncheck,
              height: 14,
              width: 14,
            ),
          ),
        ),
        Text(
          "勾选即代表同意",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF666666),
          ),
        ),
        Text(
          "《用户使用协议》",
          style: TextStyle(
            color: Color(0xFFEB4D44),
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Widget _submitBtn(bool isEnable) {
    return Container(
      width: double.infinity,
      height: 40,
      child: CommonButton.style1(
          btnTxt: "获取验证码",
          isEnable: canSubmit(),
          clickLi: () {
            _submit();
            Fluttertoast.showToast(
                msg: "你点你🐎呢 ，栽种",
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.black26);
          }),
    );
  }

  _onInputChange(String inputStr) {
    setState(() {
      isValidPhone = inputStr.isNotEmpty;
    });
  }

  _submit() {
    var inputStr = inputCtrl.text;
    debugPrint("让👴康康 你这个憨批输入了啥 $inputStr");
  }
}
