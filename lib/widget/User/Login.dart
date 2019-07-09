import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      child: new Container(
        child: new Text("界面")
      )
    );
  }
}