import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bridge/res.dart';

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputState();
  }
}

class _InputState extends State {
  List data = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, pos) {
//        var item = data[pos] as FormInputItem;
          return FormInputItemView("$pos", "index $pos");
        },
        itemCount: 100,
      ),
    );
  }
}

class FormInputItemView extends StatelessWidget {
  final String id;
  final String value;

  FormInputItemView(this.id, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("表单行数"),
        Text("表单行数 $id"),
        Expanded(child: TextFormField(controller: TextEditingController(text: "hahaha"),)),
//        TextField(),
      ],
    );
  }
}

class FormInputItem {
  final String formId;
  final Object originData;

  FormInputItem(this.formId, this.originData);
}
