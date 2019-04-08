/*
 * @Author: wei.liu 
 * @Date: 2019-03-31 20:53:31 
 * @Last Modified by: wei.liu
 * @Last Modified time: 2019-03-31 20:56:08
 */
import 'package:flutter/material.dart';

/// 搜索模块
/// @param { String label, Function onChange } 提示文字与输入信息变更事件
class SearchFiled extends StatefulWidget {
  SearchFiled({ 
    Key key, 
    this.label,
    this.onChange 
    }):super(key:key);

  final Function onChange;
  String label;

  @override
  State<StatefulWidget> createState() {
    return new SearchFiledState();
  }

}

/// 搜索模块状态组件
class SearchFiledState extends State<SearchFiled> {

  /// 渲染搜索文本框
  Widget buildSearchFiled(String label, Function onChange) {
    return Theme(
      data: new ThemeData(primaryColor: Colors.grey),
      child: new TextField(
        cursorColor: Colors.grey,
        onChanged: onChange,
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          border: InputBorder.none,
          icon: new Icon(Icons.search),
          suffixIcon: new Icon(IconData(0xeb2a, fontFamily: "iconFont"), size: 28.0),
          hintText: label,
          hintStyle: new TextStyle(
            fontSize: 14,
            color: Color.fromARGB(50, 0, 0, 0),
          ),
        ),
        style: new TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

  /// 渲染搜索框
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
      ),
      alignment: Alignment.center,
      height: 36,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: buildSearchFiled(widget.label, widget.onChange),
    );
  }
}