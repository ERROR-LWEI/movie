/*
 * @Author: wei.liu 
 * @Date: 2019-03-31 18:28:27 
 * @Last Modified by: wei.liu
 * @ 首页
 * @Last Modified time: 2019-03-31 20:52:13
 */
import 'package:flutter/material.dart';
import 'package:movie/components/search/SearchFiled.dart';
import 'package:flutter/animation.dart';
import 'package:movie/pages/home/AppbarNav.dart';
import 'package:movie/pages/home/Dynamic.dart';
import 'package:movie/pages/home/Hotspot.dart';
import 'package:movie/pages/home/Recommend.dart';

class Home extends StatefulWidget {

  @override
  HomeState createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String label = "动态";
  Widget homepage = new Dynamic();
  Animation<double> animation;
  AnimationController controller;
  Animation curve;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation = new Tween(begin: 14.0, end: 20.0).animate(curve)
      ..addStatusListener((state) => debugPrint("$state"));
  }

  // 首页切换
  // @param { String str } 选中的栏目信息
  void _onNavTap(String str) {
    Widget page = new Dynamic();
    switch (str) {
      case "动态":
        page = new Dynamic();
        break;
      case "推荐":
        page = new Recommend();
        break;
      case "热点":
        page = new Hotspot();
        break;
    }
    setState(() {
      homepage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new SearchFiled(label: label, onChange: _onNavTap),
        bottom: PreferredSize(
          child: AppbarNav(navs: ["动态","推荐"], onTap: _onNavTap,),
          preferredSize: Size(100, 30),
        ),
        brightness: Brightness.dark,
      ),
      body: homepage,
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
