/*
 * @Author: wei.liu 
 * @Date: 2019-03-31 18:28:27 
 * @Last Modified by: wei.liu
 * @ 首页
 * @Last Modified time: 2019-03-31 20:52:13
 */
import 'package:flutter/material.dart';
import 'package:movie/components/search/SearchFiled.dart';

class Home extends StatefulWidget {

  @override
  HomeState createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {
  String label = "动态";

  // 导航栏点击事件
  // @param { String str } 选中的栏目信息
  void _onNavTap(String str) {
    setState(() {
      label = str;
    });
  }
  
  // 渲染导航栏的单个选项
  Widget buildNavBarText(String label, Function onTap) {

    return new GestureDetector(
      onTap: () => onTap(label),
      child: new Text(label, style: TextStyle(
        color: Colors.white,
        fontSize: 16.0
      )),
    );
  }

  // 渲染appbar底部的文字导航
  Widget buildNavBar(Function onTap) {
    return new Container(
      width: 200,
      padding: EdgeInsets.only(bottom: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildNavBarText("动态", onTap),
          buildNavBarText("推荐", onTap)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new SearchFiled(label: label, onChange: _onNavTap),
        bottom: PreferredSize(
          child: buildNavBar(_onNavTap),
          preferredSize: Size(100, 30),
        ),
        brightness: Brightness.dark,
      ),
      body: Text(label),
    );
  }
}
