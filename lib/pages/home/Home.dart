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
import 'package:movie/components/appbarnav/AppbarNav.dart';
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
  /// 当前页面
  Widget homepage = new Dynamic();
  /// 当前页面

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
      label = str;
    });
  }

  /// 底部导航栏选择事件
  void bottomNavOnTap(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new SearchFiled(label: label, onChange: _onNavTap),
        bottom: PreferredSize(
          child: AppbarNav(navs: ["动态","推荐", "热点"], onTap: _onNavTap, color: Colors.white,),
          preferredSize: Size(100, 30),
        ),
        brightness: Brightness.dark,
      ),
      backgroundColor: Colors.black12,
      body: homepage,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
