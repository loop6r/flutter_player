import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final bool enable;
  final Color textEnableColor;
  final Color txtDisableColor;
  final Color txtPressedColor;

  final Color bgEnableColor;
  final Color bgDisableColor;
  final Color bgPressedColor;
  final String txt;

  final VoidCallback clickLi;

  CommonButton(
      {@required this.enable,
      @required this.textEnableColor,
      @required this.txtDisableColor,
      @required this.txtPressedColor,
      @required this.bgEnableColor,
      @required this.bgDisableColor,
      @required this.bgPressedColor,
      @required this.txt,
      @required this.clickLi});

  static CommonButton style1(
      {bool isEnable = true,
      @required String btnTxt,
      @required VoidCallback clickLi}) {
    return CommonButton(
      enable: isEnable,
      textEnableColor: Colors.white,
      txtDisableColor: Color(0x73EB4D44),
      txtPressedColor: Colors.white,
      bgDisableColor: Color(0x1AEB4D44),
      bgPressedColor: Color(0xFFCC433B),
      bgEnableColor: Color(0xFFEB4D44),
      txt: btnTxt,
      clickLi: clickLi,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: RawMaterialButton(
        onPressed: enable ? clickLi : null,
        child: Text(
          txt,
          style: TextStyle(
            color: enable ? textEnableColor : txtDisableColor,
            fontSize: 16,
          ),
        ),
        splashColor: Colors.transparent,
        highlightColor: bgPressedColor,
        fillColor: enable ? bgEnableColor : bgDisableColor,
        highlightElevation: 0,
        elevation: 0,
        focusElevation: 0,
        disabledElevation: 0,
        hoverElevation: 0,
      ),
    );
  }

  _onPressed() {}
}
