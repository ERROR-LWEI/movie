import 'package:flutter/material.dart';

class Hotspot extends StatefulWidget {

  @override
  HotspotState createState() => HotspotState();
}

class HotspotState extends State<Hotspot> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text("热点"),
    );
  }
}