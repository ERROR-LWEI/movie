import 'package:flutter/material.dart';
import 'package:movie/pages/home/Home.dart';
//import 'package:movie/components/search/SearchFiled.dart';
// import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build (BuildContext context) {

    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home:new Home(),
    );
  }
}
