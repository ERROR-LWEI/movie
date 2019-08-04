import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
    SearchComponent({ 
      Key key, 
      this.label,
      this.onChange 
    }):super(key:key);

  final Function onChange;
  String label;

  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  
  Widget buildSearchFiled(String label, Function onChange) {
    return Theme(
      data: new ThemeData(primaryColor: Colors.grey),
      child: new TextField(
        cursorColor: Colors.grey,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: label,
          hintStyle: new TextStyle(
            fontSize: 14,
            color: Color.fromARGB(50, 0, 0, 0),
          ),
        ),
        style: new TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
      ),
      alignment: Alignment.center,
      height: 36,
      //width: 200,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: buildSearchFiled(widget.label, widget.onChange),
    );
  }
}