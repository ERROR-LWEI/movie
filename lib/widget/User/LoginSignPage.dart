import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/application.dart';
import 'package:movie/style/theme.dart' as theme;

class LoginSignPage extends StatefulWidget {
  @override
  _LoginSignPageState createState() => _LoginSignPageState();
}

class _LoginSignPageState extends State<LoginSignPage> {

  void onSkip(BuildContext context, String name) {
    Application.router.navigateTo(
      context, name, 
      transition: TransitionType.inFromRight
    ).then((val) {
      if (val != null) {
        print(val);
      }
    });
  }

  Widget buildLoginBottom(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          // gradient: theme.Theme.primaryGradient,
          color: Colors.black87
        ),
        child: new Text("登陆", style: new TextStyle(fontSize: 25, color: Colors.white),),
      ),
      onTap: (){
        this.onSkip(context, "/auth/login");
      },
    );
  }

  Widget buildSiginBottom(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.black26
        ),
        child: new Text("注册", style: new TextStyle(fontSize: 25, color: Colors.white),),
      ),
      onTap: (){
        this.onSkip(context, "/auth/sigin");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
        top: false,
        child: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: MediaQuery.of(context).padding.bottom),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              //gradient: theme.Theme.primaryGradient
              color: Colors.white
            ),
            child: new Column(
              children: <Widget>[
                buildLoginBottom(context),
                buildSiginBottom(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}