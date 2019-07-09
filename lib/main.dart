import 'package:flutter/material.dart';
// import 'package:movie/widget/Layout.dart';
import 'package:movie/widget/User/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build (BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home:new Login(),
    );
  }
}