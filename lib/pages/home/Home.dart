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

class Home extends StatefulWidget {

  @override
  HomeState createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String label = "动态";
  Animation<double> animation;
  AnimationController controller;
  Animation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation = new Tween(begin: 14.0, end: 20.0).animate(curve)
      ..addStatusListener((state) => debugPrint("$state"));
  }

  // 导航栏点击事件
  // @param { String str } 选中的栏目信息
  void _onNavTap(String str) {
    setState(() {
      label = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new SearchFiled(label: label, onChange: _onNavTap),
        bottom: PreferredSize(
          child: AppbarNav(navs: ["动态","推荐","热点"], onTap: _onNavTap,),
          preferredSize: Size(100, 30),
        ),
        brightness: Brightness.dark,
      ),
      body: Text(label),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
