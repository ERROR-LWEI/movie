/*
 * @Author: wei.liu 
 * @Date: 2019-04-07 21:29:58 
 * @Last Modified by:   wei.liu 
 * @Last Modified time: 2019-04-07 21:29:58 
 */
import 'package:flutter/material.dart';

/// 简略信息卡片
class Briefcard extends StatefulWidget{
  @override 
  BriefcardState createState() => BriefcardState();
}

class BriefcardState extends State<Briefcard> {
  final bool isStar = false;


  @override 
  Widget build(BuildContext context) {
    return new Container(
      child: new Text("简略"),
    );
  }
}