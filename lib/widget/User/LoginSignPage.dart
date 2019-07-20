import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/application.dart';
import 'package:movie/style/AntIcons.dart';
import 'package:url_launcher/url_launcher.dart';

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
        padding: EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
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
        padding: EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
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
        bottom: false,
        child: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: MediaQuery.of(context).padding.bottom),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              //gradient: theme.Theme.primaryGradient,
              color: Colors.white
            ),
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Image.asset("assets/images/logo.jpg"),
                ),
                buildLoginBottom(context),
                new SizedBox(height: 20,),
                buildSiginBottom(context),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        height: 1,
                        width: 100,
                        decoration: BoxDecoration(
                          //gradient: new LinearGradient(colors: [Colors.white10, Colors.white])
                          color: Colors.black26
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: new Text("或", style: new TextStyle(fontSize: 16, color: Colors.black54)),
                      ),
                      new Container(
                        height: 1,
                        width: 100,
                        decoration: BoxDecoration(
                          // gradient: new LinearGradient(
                          //   colors: [Colors.white, Colors.white10]
                          // )
                          color: Colors.black26
                        ),
                      )
                    ],
                  ),
                ),
                new SizedBox(height: 20,),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: new IconButton(icon: Icon(AntIcons.wechat_fill), color: Colors.green, iconSize: 50, onPressed: () async{
                        if(await canLaunch('wexin://')) {
                          await launch('wexin://');
                        }
                      },),
                    ),
                    new SizedBox(width: 40,),
                    new Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: new IconButton(icon: Icon(AntIcons.weibo), color: Colors.red, iconSize: 50, onPressed: () async{},),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}