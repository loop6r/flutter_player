import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bridge/RouterTable.dart';
import 'package:flutter_bridge/view/account/login.dart';
import 'package:flutter_bridge/view/account/register/RegisterPager.dart';
import 'package:flutter_bridge/view/account/register/state/state.dart';
import 'package:flutter_bridge/view/empty/EmptyPage.dart';
import 'package:flutter_bridge/view/home/HomePage.dart';
import 'package:flutter_bridge/view/list/InputPage.dart';
import 'package:flutter_bridge/view/list/ListPage.dart';
import 'package:flutter_bridge/view/main/MainTab.dart';
import 'package:flutter_bridge/view/mine/MinePage.dart';
import 'package:flutter_bridge/view/test/TestWidget.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //设置设置状态栏颜色
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
        RouterTable.RegisterPage: (ctx) => ChangeNotifierProvider(
              create: (_) => RegisterPageModel(),
              child: RegisterPager(),
            ),
      },
//      initialRoute: RouterTable.Launcher,
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
  int currentItem = 0;
  PageController pageCtrl;

  @override
  void initState() {
    super.initState();
    pageCtrl = PageController(initialPage: currentItem);
  }

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: PageView.builder(
        controller: pageCtrl,
        itemBuilder: _buildPage,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onNavigationItemClick,
        currentIndex: 0,
        items: _getNavigationItems(),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<BottomNavigationBarItem> _getNavigationItems() {
    return [
      BottomNavigationBarItem(
          backgroundColor: Colors.white,
          title: Text("tab1"),
          icon: Icon(Icons.watch)),
      BottomNavigationBarItem(
          backgroundColor: Colors.white,
          title: Text("tab2"),
          icon: Icon(Icons.print))
    ];
  }

  _onNavigationItemClick(int index) {
    pageCtrl.jumpToPage(index);
  }

  Widget _buildPage(BuildContext ctx, int position) {
    if (position == 0) {
      return HomePage();
    } else {
      return MinePage();
    }
  }
}
