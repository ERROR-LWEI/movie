import 'package:flutter/material.dart';
import 'package:movie/widget/home.dart';

class Layout extends StatefulWidget {
  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> with SingleTickerProviderStateMixin {
  // 当前页面
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      body: Home(),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: onTap,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home, size: 26.0),
            title: new Text("首页"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.movie, size: 26.0),
            title: new Text("电影"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(IconData(0xebe9, fontFamily: 'iconFont'), size: 26.0),
            title: new Text("小组"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(IconData(0xeba3, fontFamily: 'iconFont'), size: 26.0),
            title: new Text("我的")
          )
        ],
      ),
    );
  }
}