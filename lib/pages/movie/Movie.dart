import 'package:flutter/material.dart';
import 'package:movie/components/search/SearchFiled.dart';
import 'package:movie/components/appbarnav/AppbarNav.dart';

/// 电影界面
class Movie extends StatefulWidget {

  @override
  MovieState createState() => MovieState();
}

class MovieState extends State<Movie> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new SearchFiled(label: '电影'),
        bottom: PreferredSize(
            child: new AppbarNav(navs: ['台词', '短剧', '朗读']),
            preferredSize: Size(100, 30)
        ),
      ),
      body: new Text('测试'),
    );
  }
}