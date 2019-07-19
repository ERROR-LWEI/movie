import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/handler.dart';

class Routes {
  static String root = "/";
  static String auth = "/auth";
  static String login = "/auth/login";
  static String sigin = "/auth/sigin";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND!!!");
      }
    );
    router.define(root, handler: authHandler);
    router.define(login, handler: loginHandler);
    router.define(sigin, handler: siginHandler);
  }
}