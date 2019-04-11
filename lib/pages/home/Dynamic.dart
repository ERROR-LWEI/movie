import 'package:flutter/material.dart';
import 'package:movie/components/card/Briefcard.dart';
import 'package:movie/DTO/dynamic.dart';

class Dynamic extends StatefulWidget {

  @override
  DynamicState createState() => DynamicState();
}

class DynamicState extends State<Dynamic> {
  List<Map<DynamicData, String>> dynamicList = [{
    // ignore: undefined_identifier
    title: "1",
  }];

  Widget buildCarList() {
    return new ListView.builder(
        padding: const EdgeInsets.only(bottom: 10.0),
        itemBuilder: (context, i) {
          final index = i ~/ 2;
//          if (index >= dynamicList.length) {
//            dynamicList.addAll()
//          }
          return new Briefcard(
            title: dynamicList[index],
          )
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Briefcard(
          title: '测试',
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