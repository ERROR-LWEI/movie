import 'package:flutter/material.dart';
import 'package:movie/components/Search.dart';
import 'package:movie/style/AntIcons.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          title: new SearchComponent(),
          centerTitle: false,
          brightness: Brightness.dark,
          automaticallyImplyLeading: false,
          flexibleSpace: Icon(Icons.email),
          actions: <Widget>[
            new Container(
              //padding: EdgeInsets.only(top: 15),
              width: 50,
              alignment: Alignment.center,
              child: new Icon(Icons.alternate_email),
            ),
          ],
          bottom: new TabBar(
            indicatorColor: Colors.green,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            indicatorPadding: EdgeInsets.only(left: 40, right: 40),
            tabs: <Widget>[
              Tab(text: "热门",),
              Tab(text: "动态",),
              Tab(text: "热门",)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
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