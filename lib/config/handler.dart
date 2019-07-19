import "package:fluro/fluro.dart";
import "package:flutter/material.dart";
import 'package:movie/widget/User/Login.dart';
import 'package:movie/widget/User/LoginSignPage.dart';
import 'package:movie/widget/User/Sigin.dart';

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