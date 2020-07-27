import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainTabState();
}

class _MainTabState<MainTab> extends State {
  int _currnet_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("标题")),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currnet_index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text("第一"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text("第二"),
          ),
        ],
        iconSize: 25,
        unselectedItemColor: Colors.black12,
        selectedItemColor: Colors.deepPurpleAccent,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        onTap: (index) {
          setState(() {
            _currnet_index = index;
          });
        },
      ),
    );
  }
}
