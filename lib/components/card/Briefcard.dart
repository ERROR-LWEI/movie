import 'package:flutter/material.dart';

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