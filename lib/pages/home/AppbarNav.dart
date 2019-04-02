import 'package:flutter/material.dart';


class AppbarNav extends StatefulWidget {
  AppbarNav({
    Key key,
    this.navs = const <String>[],
    this.onTap,
  }): super(key:key);
  final navs;
  final Function onTap;

  @override
  AppbarNavState createState() => AppbarNavState();
}

class AppbarNavState extends State<AppbarNav> {
  final navs_names = new Set<String>();

  void _initState() {
    super.initState();
    pushnavs();
  }

  void pushnavs() {
    for(var i = 0; i < widget.navs; i ++) {
      if (navs_names.contains(widget.navs[i])) {
        navs_names.remove(widget.navs[i]);
      } else {
        navs_names.add(widget.navs[i]);
      }
    }
  }


  void buildNavs(List<String> navs) {

  }


  Widget buildList() {
    return new ListTile();
  }
  
  @override
  Widget build(BuildContext context) {

    buildNavs(widget.navs);

    return new Container(
      width: 200,
      padding: EdgeInsets.only(bottom: 6.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _navs,
      ),
    );
  }
}