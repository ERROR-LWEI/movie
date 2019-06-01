import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 1,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(child: Text("动态"),),
              Tab(child: Text("推荐"),),
              Tab(child: Text("热门"),),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.movie),
            Icon(Icons.nature),
            Icon(Icons.navigation),
          ],
        )
      ),
    );
  }
}