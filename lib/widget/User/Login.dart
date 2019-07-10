import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({ Key key }) : super(key: key);

  @override
  LoginState createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        child: new Text("界面")
      )
    );
  }
}