import 'package:flutter/material.dart';


class AppbarNav extends StatefulWidget {
  AppbarNav({
    Key key,
    this.navs = const <String>[],
    this.onTap,
    this.color = Colors.black45,
  }): super(key:key);
  final Color color;
  final navs;
  final Function onTap;

  @override
  AppbarNavState createState() => AppbarNavState();
}

class AppbarNavState extends State<AppbarNav> {

  Widget buildNav(String str, Function onTap) {
    return new GestureDetector(
      onTap: () => onTap(str),
      child: new Container(
        child: new Text(str, style: TextStyle(fontSize: 16.0, color: Colors.white)),
      ),
    );
  }

  /// 塞入导航栏
  List<Widget> pushNavs(List<String> navs, Function onTap) {
    List<Widget> _navs = [];
    for(String nav in navs) {
      _navs.add(
          new GestureDetector(
            onTap: () => onTap(nav),
            child: new Container(
              child: new Text(nav, style: TextStyle(fontSize: 16.0, color: widget.color)),
            ),
          )
      );
    }
    return _navs;
  }


  Widget buildList() {
    return new ListTile();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navstion = pushNavs(widget.navs, widget.onTap);
    return new Container(
      width: 200,
      padding: EdgeInsets.only(bottom: 6.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navstion,
      ),
    );
  }
}