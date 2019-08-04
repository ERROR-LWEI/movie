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

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  FocusNode accountFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode confirmPasswordNode = new FocusNode();
  FocusScopeNode focusScopeNode = new FocusScopeNode();
  GlobalKey<FormState> _resetFormKey = new GlobalKey();
  bool isShowPassword = false;
  bool isShowPasswordConfirm = false;

  String account;
  String password;
  String confirmPassword;

  void showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  void showPasswordConfirm() {
    setState(() {
      isShowPasswordConfirm = !isShowPasswordConfirm;
    });
  }

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

  void _resetFunc(Function func) {
    HttpDio.getInstance().post(
      apipath['login'], 
      (ResponseJson value){
        func();
        if (value.code == 1 && value.type != "ERROR") {
          onSkip(context, '/auth/sigin');
          _resetFormKey.currentState.reset();
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
      // decoration: new BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.black12),
      width: 500,
      height: 200,
      child: new Form(
        key: _resetFormKey,
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
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: new TextFormField(
                  focusNode: confirmPasswordNode,
                  decoration: new InputDecoration(
                    hintText: "确认密码",
                    border: InputBorder.none,
                    suffixIcon: new IconButton(icon: new Icon(isShowPasswordConfirm ? AntIcons.eye_close_fill : AntIcons.eye_close, color: Colors.black45,), onPressed: showPasswordConfirm,)
                  ),
                  obscureText: !isShowPasswordConfirm,
                  style: new TextStyle(fontSize: 18, color: Colors.black),
                  onSaved: (value){
                    setState(() {
                      confirmPassword=value;
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

  Widget buildResetButton(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(top: 40, bottom: 2),
        alignment: Alignment.centerRight,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text("重置", style: new TextStyle(fontSize: 25),),
            new Icon(AntIcons.arrowright,size: 25,)
          ],
        ),
        //child: new Text("登陆", style: new TextStyle(fontSize: 25),),
      ),
      onTap: () async {
        _resetFormKey.currentState.save();
        if(account.isNotEmpty && password.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context){
              return new LoadingDialog(
                loadingText: '重置中...',
                outsideDismiss: false,
                dismissDialog: _resetFunc,
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
                  child: new Text("密码重置", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                buildFomField(),
                buildResetButton(context)
              ],
            ),
          ),
        ),
      )
    );
  }
}