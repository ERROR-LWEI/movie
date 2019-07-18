import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/style/theme.dart' as theme;
import 'package:movie/config/api.dart';
import 'package:movie/service/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode focusScopeNode = new FocusScopeNode();
  GlobalKey<FormState> _loginFormKey = new GlobalKey();
  bool isShowPassword = false;

  String _name;
  String _password;


  void showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 23),
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Column(
            children: <Widget>[
              buildLoginTextForm(),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: new Text(
                  "忘记密码?",
                  style: new TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height: 1,
                      width: 100,
                      decoration: BoxDecoration(gradient: new LinearGradient(colors: [Colors.white10, Colors.white])),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: new Text("或", style: new TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    new Container(
                      height: 1,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [Colors.white, Colors.white10]
                        )
                      ),
                    )
                  ],
                ),
              ),
              new SizedBox(height: 10,),
              // 三方平台
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new IconButton(icon: Icon(FontAwesomeIcons.github), color: Color(0xFF0084ff), onPressed: null,),
                  ),
                  new SizedBox(width: 40,),
                  new Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new IconButton(icon: Icon(FontAwesomeIcons.facebookF), color: Color(0xFF0084ff),onPressed: null,),
                  )
                ],
              ),
            ],
          ),
          //buildLoginButton()
          new Positioned(child: buildLoginButton(), top: 210,)
        ],
      ),
    );
  }

  Widget buildLoginTextForm() {
    return new Container(
      decoration: new BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.white),
      width: 300,
      height: 190,
      child: new Form(
        key: _loginFormKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
                child: new TextFormField(
                  focusNode: emailFocusNode,
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(passwordFocusNode);
                  },
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.email, color: Colors.black,),
                    hintText: "邮箱",
                    border: InputBorder.none
                  ),
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  // 校验
                  validator: (value) {
                    if (value.isEmpty) {
                      return "邮箱不能为空";
                    }
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                child: new TextFormField(
                  focusNode: passwordFocusNode,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.lock, color: Colors.black),
                    hintText: '密码',
                    border: InputBorder.none,
                    suffixIcon: new IconButton(icon: new Icon(Icons.remove_red_eye, color: Colors.black), onPressed: showPassword,)
                  ),
                  obscureText: !isShowPassword,
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value){
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "密码不能为空且不能小于6位";
                    }
                  },
                  onSaved: (value){
                    _password = value;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget buildLoginButton() {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: theme.Theme.primaryGradient,
        ),
        child: new Text("登陆", style: new TextStyle(fontSize: 25, color: Colors.white),),
      ),
      onTap: () {
        if(_loginFormKey.currentState.validate()) {
          Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("进行登陆"),));
          _loginFormKey.currentState.save();

          HttpDio.getInstance().post(apipath['login'], (data){
            print(data);
          }, params: { 'account': _name, 'password': _password }, error: (err){
            print(err);
          });
          print('帐户$_name, 密码$_password');
        }
      },
    );
  }
}