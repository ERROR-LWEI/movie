import 'package:flutter/material.dart';
import 'package:movie/components/card/Briefcard.dart';

class Dynamic extends StatefulWidget {

  @override
  DynamicState createState() => DynamicState();
}

class DynamicState extends State<Dynamic> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Briefcard(
          icons: [
            IconData(0xe60f, fontFamily: "iconFont"),
            IconData(0xe61e, fontFamily: 'iconFont'),
            IconData(0xe604, fontFamily: 'iconFont')],
          num:['1','2', '5'],
          iconSize: 20.0,
      ),
    );
  }
}