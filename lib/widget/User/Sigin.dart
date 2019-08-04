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


class SiginPage extends StatefulWidget {
  @override
  _SiginPageState createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  FocusNode _accountFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  FocusScopeNode _focusScopeNode = new FocusScopeNode();
  GlobalKey<FormState> _siginFormKey = new GlobalKey();
  bool _isShowPassword = false;

  String _account;
  String _password;

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


  void _siginFunc(Function func) {
    HttpDio.getInstance().post(
      apipath['sigin'], 
      (ResponseJson value){
        func();
        if (value.code == 1 && value.type != "ERROR") {
          onSkip(context, '/home');
          _siginFormKey.currentState.reset();
        }
      },
      params: {
        'type': 'user',
        'account': _account,
        'password': encode(_password)
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
        key: _siginFormKey,
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: new TextFormField(
                  focusNode: _accountFocusNode,
                  onEditingComplete: () {
                    if (_focusScopeNode == null) {
                      _focusScopeNode = FocusScope.of(context);
                    }
                    _focusScopeNode.requestFocus(_passwordFocusNode);
                  },
                  decoration: new InputDecoration(
                    hintText: "输入邮箱/手机号",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none
                  ),
                  style: new TextStyle(fontSize: 18, color: Colors.black),
                  onSaved: (value) {
                    setState(() {
                      _account=value;
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
                  focusNode: _passwordFocusNode,
                  decoration: new InputDecoration(
                    hintText: "输入密码",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black26)
                  ),
                  obscureText: !_isShowPassword,
                  style: new TextStyle(fontSize: 18, color: Colors.black),
                  onSaved: (value){
                    setState(() {
                      _password=value;
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
        padding: EdgeInsets.only(top: 25, bottom: 2),
        alignment: Alignment.centerRight,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text("注册", style: new TextStyle(fontSize: 25),),
            new Icon(AntIcons.arrowright, size: 25,)
          ],
        ),
        //child: new Text("登陆", style: new TextStyle(fontSize: 25),),
      ),
      onTap: () {
        _siginFormKey.currentState.save();
        if(_account.isNotEmpty && _password.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context){
              return new LoadingDialog(
                loadingText: '注册中...',
                outsideDismiss: false,
                dismissDialog: _siginFunc,
              );
            }
          );
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
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
                  child: new Text("账号注册", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                buildFomField(),
                buildLoginButton(context)
              ],
            ),
          ),
        ),
      )
    );
  }
}