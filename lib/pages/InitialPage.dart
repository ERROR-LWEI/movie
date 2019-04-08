import 'package:flutter/material.dart';
import 'package:movie/pages/home/Home.dart';
import 'package:movie/pages/movie/Movie.dart';
import 'package:movie/pages/group/Group.dart';
import 'package:movie/pages/admin/Admin.dart';

class InitialPage extends StatefulWidget {
  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> with SingleTickerProviderStateMixin {
  final _key = new GlobalKey<ScaffoldState>();
  // 当前页面
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }

  void pageSetIndex(int inx) {
    setState(() {
      pageIndex = inx;
    });
  }

  /// 渲染页面函数
  Widget buildPage(int index){
    return new IndexedStack(
      children: <Widget>[
        new Home(),
        new Movie(),
        new Group(),
        new Admin(),
      ],
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    /// 当前渲染的页面
    final Widget _body = buildPage(pageIndex);

    return new Scaffold(
      appBar: null,
      body: _body,
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: pageSetIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home, size: 26.0,),
            title: new Text("首页"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.movie, size: 26.0,),
            title: new Text("电影"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(IconData(0xebe9, fontFamily: "iconFont"), size: 26.0,),
            title: new Text("小组"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(IconData(0xeba3, fontFamily: "iconFont"), size: 26.0,),
            title: new Text("我的"),
          ),
        ],
      ),
    );
  }
}