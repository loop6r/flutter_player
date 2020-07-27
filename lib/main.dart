import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bridge/RouterTable.dart';
import 'package:flutter_bridge/view/account/register/Register.dart';
import 'package:flutter_bridge/view/account/login.dart';
import 'package:flutter_bridge/view/account/register/RegisterPager.dart';
import 'package:flutter_bridge/view/list/InputPage.dart';
import 'package:flutter_bridge/view/list/ListPage.dart';
import 'package:flutter_bridge/view/main/MainTab.dart';
import 'package:flutter_bridge/view/test/TestWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent, // status bar color
//    ));
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        RouterTable.MAIN_TAB: (ctx) => MainTab(),
        RouterTable.LOGIN: (ctx) => LoginPage(),
        RouterTable.DemoInputPage: (ctx) => ListPage(),
        RouterTable.TestPage: (ctx) => TestPage(),
        RouterTable.ListInputPage: (ctx) => InputPage(),
        RouterTable.RegisterPage: (ctx) => RegisterPager(),
      },
      title: 'Flutter Demo',
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      if (_counter >= 3) {
        Navigator.pushNamed(context, RouterTable.Launcher);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
