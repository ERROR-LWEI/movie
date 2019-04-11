/*
 * @Author: wei.liu 
 * @Date: 2019-04-07 21:29:58 
 * @Last Modified by:   wei.liu 
 * @Last Modified time: 2019-04-07 21:29:58 
 */
import 'package:flutter/material.dart';

/// 简略信息卡片
class Briefcard extends StatefulWidget{
  Briefcard({
    Key key,
    this.icons = const <IconData>[],
    this.num = const <String>[],
    this.iconSize = 24.0,
    this.color = Colors.black45,
    this.fontColor = Colors.black45,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.w400,
    this.title = '',
  }) : super(key:key);
  final icons;
  /// 按钮操作统计数
  final num;
  final iconSize;
  /// 按钮颜色
  final color;
  /// 字体颜色
  final fontColor;
  /// 字体大小
  final fontSize;
  /// 字体粗细
  final fontWeight;
  /// 显示信息
  final String title;

  @override 
  BriefcardState createState() => BriefcardState();
}

class BriefcardState extends State<Briefcard> {

  /// 渲染用户信息
//  Widget buildUserMessage() {
//  }

  /// 渲染文本信息
  Widget buildText(String str) {

    return new Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: new Text(str),
    );
  }

  Widget buildIconButton(IconData icon, String str) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Icon(icon, color: widget.color, size: widget.iconSize),
        new Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: new Text(str, style: new TextStyle(
            color: widget.fontColor,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          )),
        )
      ],
    );
  }

  /// 渲染icon按钮列表
  Widget buildBotton(List<String> nums, List<IconData> icons) {
    List<Widget> iconBtn = [];
    for (var i = 0; i<nums.length; i ++) {
      iconBtn.add(buildIconButton(icons[i], nums[i]));
    }
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: iconBtn,
    );
  }

  @override 
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            offset: Offset.zero,
            blurRadius: 4.0,
            spreadRadius: 1.0,
          )
        ]
      ),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildText(widget.title),
          buildBotton(widget.num, widget.icons)
        ],
      ),
    );
  }
}