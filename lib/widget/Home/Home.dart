import 'package:flutter/material.dart';
import 'package:movie/components/Search.dart';
import 'package:movie/style/AntIcons.dart';
import 'package:movie/widget/Home/Index/Index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem> [
    BottomNavigationBarItem(icon: Icon(AntIcons.home),title: new Text("首页"), activeIcon: Icon(AntIcons.home_fill)),
    BottomNavigationBarItem(icon: Icon(Icons.email), title: new Text("邮件")),
    BottomNavigationBarItem(icon: Icon(AntIcons.user), title: new Text("我")),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        body: IndexPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            this.setState(() {
              this._currentIndex = index;
            });
          },
          items: _list,
        ),
      )
    );
  }
}