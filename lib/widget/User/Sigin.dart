import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/application.dart';
import 'package:movie/style/AntIcons.dart';


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

  void _showPassword() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  Widget buildFomField() {
    return new Container(
      // decoration: new BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.black12),
      width: 500,
      height: 140,
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
                    suffixIcon: new IconButton(icon: new Icon(_isShowPassword ? AntIcons.eye_close_fill : AntIcons.eye_close, color: Colors.black45,), onPressed: _showPassword,)
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
        if(_siginFormKey.currentState.validate()) {
          _siginFormKey.currentState.save();
          //print(_account.isEmpty);
        }
        // if(_loginFormKey.currentState.validate()) {
        //   Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("进行登陆"),));
        //   _loginFormKey.currentState.save();
        // }
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