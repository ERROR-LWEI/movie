import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/components/LoadingDialog.dart';
import 'package:movie/config/api.dart';
import 'package:movie/config/application.dart';
import 'package:movie/models/ResponseJson.dart';
import 'package:movie/service/http.dart';
import 'package:movie/style/AntIcons.dart';
import 'package:movie/utils/cipher.dart';

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

  void onSkip(BuildContext context, String name) {
    Application.router.navigateTo(
      context, name, 
      transition: TransitionType.inFromRight
    ).then((val) {
      if (val != null) {
        //print(val);
      }
    });
  }


  void _loginFunc(Function func) {
    HttpDio.getInstance().post(
      apipath['login'], 
      (ResponseJson value){
        func();
        if (value.code == 1 && value.type != "ERROR") {
          onSkip(context, '/home');
          _loginFormKey.currentState.reset();
        }
      },
      params: {
        'account': account,
        'password': encode(password)
      },
      error: (DioError e) {
        print(e);
        func();
      }
    );
  }

  Widget buildFomField() {
    return new Container(
      width: 500,
      height: 160,
      padding: EdgeInsets.only(top: 20.0),
      child: new Form(
        key: _loginFormKey,
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 8),
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
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black26)
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
                padding: EdgeInsets.only(top: 10, bottom: 8,),
                child: new TextFormField(
                  focusNode: passwordFocusNode,
                  decoration: new InputDecoration(
                    hintText: "输入密码",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
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
            new Icon(AntIcons.arrowright,size: 25,)
          ],
        ),
        //child: new Text("登陆", style: new TextStyle(fontSize: 25),),
      ),
      onTap: () async {
        _loginFormKey.currentState.save();
        if(account.isNotEmpty && password.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context){
              return new LoadingDialog(
                loadingText: '登录中...',
                outsideDismiss: false,
                dismissDialog: _loginFunc,
              );
            }
          );
        }
      },
    );
  }

  Widget buildResetPassword(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(top: 5),
        alignment: Alignment.centerLeft,
        child: new Text("忘记密码?", style: new TextStyle(fontSize: 16, color: Colors.black38),),
      ),
      onTap: () {
        onSkip(context, '/auth/resetPassword');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
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