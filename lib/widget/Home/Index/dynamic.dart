import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: new Container(
          color: Colors.white,
          child: new Text("动态"),
        ),
    );
  }
}