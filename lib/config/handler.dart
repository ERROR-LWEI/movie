import "package:fluro/fluro.dart";
import "package:flutter/material.dart";
import 'package:movie/widget/Home/Home.dart';
import 'package:movie/widget/User/Login.dart';
import 'package:movie/widget/User/LoginSignPage.dart';
import 'package:movie/widget/User/Sigin.dart';
import 'package:movie/widget/User/Reset.dart';

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Home();
  }
);

var authHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params) {
    return new LoginSignPage();
  }
);

var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new LoginPage();
  }
);

var siginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SiginPage();
  }
);

var resetHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ResetPage();
  }
);