import 'package:flutter/material.dart';

// 电影信息图片卡片
class MovieCard extends StatefulWidget {
  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(),
      child: new Text("card")
    );
  }
}