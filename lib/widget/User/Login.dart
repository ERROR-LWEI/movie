import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/application.dart';
import 'package:movie/style/AntIcons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode accountFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode focusScopeNode = new FocusScopeNode();
  GlobalKey<FormState> _loginFormKey = new GlobalKey();
  bool isShowPassword = false;

  String account;
  String password;

  void showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

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

  Widget buildFomField() {
    return new Container(
      // decoration: new BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.black12),
      width: 500,
      height: 140,
      child: new Form(
        key: _loginFormKey,
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: new TextFormField(
                  focusNode: accountFocusNode,
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(passwordFocusNode);
                  },
                  decoration: new InputDecoration(
                    hintText: "输入邮箱/手机号",
                    border: InputBorder.none
                  ),
                  style: new TextStyle(fontSize: 18, color: Colors.black),
                  onSaved: (value) {
                    setState(() {
                      account=value;
                    });
                  },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 500,
              color: Colors.black12,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: new TextFormField(
                  focusNode: passwordFocusNode,
                  decoration: new InputDecoration(
                    hintText: "输入密码",
                    border: InputBorder.none,
                    suffixIcon: new IconButton(icon: new Icon(isShowPassword ? AntIcons.eye_close_fill : AntIcons.eye_close, color: Colors.black45,), onPressed: showPassword,)
                  ),
                  obscureText: !isShowPassword,
                  style: new TextStyle(fontSize: 18, color: Colors.black),
                  onSaved: (value){
                    setState(() {
                      password=value;
                    });
                  },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 500,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(top: 2, bottom: 2),
        alignment: Alignment.centerRight,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text("登陆", style: new TextStyle(fontSize: 25),),
            new Icon(Icons.remove_circle)
          ],
        ),
        //child: new Text("登陆", style: new TextStyle(fontSize: 25),),
      ),
      onTap: () {
        if(_loginFormKey.currentState.validate()) {
          _loginFormKey.currentState.save();
          print(account.isEmpty);
        }
        // if(_loginFormKey.currentState.validate()) {
        //   Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("进行登陆"),));
        //   _loginFormKey.currentState.save();
        // }
      },
    );
  }

  Widget buildResetPassword(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(top: 15),
        alignment: Alignment.centerLeft,
        child: new Text("忘记密码?", style: new TextStyle(fontSize: 16, color: Colors.black38),),
      ),
      onTap: () {
        onSkip(context, '/auth/sigin');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, bottom: MediaQuery.of(context).padding.bottom,
              left: 40,
              right: 40
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              // gradient: theme.Theme.primaryGradient,
              color: Colors.white
            ),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.centerLeft,
                  child: new Text("账号登陆", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                buildFomField(),
                buildResetPassword(context),
                buildLoginButton(context)
              ],
            ),
          ),
        ),
      )
    );
  }
}