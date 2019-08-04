import 'package:flutter/material.dart';
import 'package:movie/components/Search.dart';
import 'package:movie/widget/Home/Index/dynamic.dart';
import 'package:movie/widget/Home/Index/Recommend.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: new SearchComponent(),
        centerTitle: false,
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        flexibleSpace: Icon(Icons.email),
        actions: <Widget>[
          new Container(
            //padding: EdgeInsets.only(top: 15),
            width: 50,
            alignment: Alignment.center,
            child: new Icon(Icons.alternate_email),
          ),
        ],
        bottom: new TabBar(
          labelPadding: EdgeInsets.only(left: 40, right: 40),
          indicatorPadding: EdgeInsets.only(left: 20.0, right: 20.0),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "热门",),
            Tab(text: "动态",),
            Tab(text: "热门",)
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
          Icon(Icons.change_history, size: 128.0, color: Colors.black12),
          Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
        ],
      ),
    );
  }
}