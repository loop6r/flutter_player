import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bridge/res.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  bool canSubmit = false;
  bool showPwd = false;

  @override
  void initState() {
    super.initState();
    VoidCallback li = () {
      setState(() {
        if (nameCtrl.text.isNotEmpty && pwdCtrl.text.isNotEmpty) {
          canSubmit = true;
        } else {
          canSubmit = false;
        }
      });
    };
    nameCtrl.addListener(li);
    pwdCtrl.addListener(li);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40)),
            Text(
              "您好！请登录",
              style: TextStyle(
                fontSize: 28,
                color: Color(0xff111111),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2)),
            Text(
              "登陆后即可查看更多精彩内容！",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff999999),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 60)),
            _getFormInput(),
            Padding(padding: EdgeInsets.only(top: 40)),
            //login btn
            GestureDetector(
              onTap: () {
                if (canSubmit) {
                  print("you click this");
                }
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: canSubmit
                        ? [Color(0xFF2260FF), Color(0xFF22A7FF)]
                        : [Color(0xFFDFDFDF), Color(0xFFDFDFDF)],
                  ),
                ),
                child: Center(
                  child: Text(
                    "登陆",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            _forgetPwdAdnRegister(),
          ],
        ),
      ),
    );
  }

  Widget _forgetPwdAdnRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "忘记密码",
          style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 1,
          height: 12,
          color: Color(0xFF999999),
        ),
        Text(
          "注册账号",
          style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
        )
      ],
    );
  }

  Widget _getFormInput() {
    Widget div() {
      return Container(
        width: double.infinity,
        height: 0.5,
        color: Color(0xFFDADADA),
      );
    }

    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: TextFormField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: "请输入账号",
                      border: InputBorder.none),
                ),
              ),
              Align(alignment: Alignment.bottomCenter, child: div())
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: TextFormField(
                  obscureText: !showPwd,
                  controller: pwdCtrl,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: "输入密码",
                      border: InputBorder.none),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: div(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPwd = !showPwd;
                    });
                  },
                  child: Image.asset(
                      showPwd ? Res.icon_eye_open : Res.icon_eye_close),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
