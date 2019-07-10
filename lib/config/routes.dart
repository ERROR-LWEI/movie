import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/config/handler.dart';

class Routes {
  static String root = "/";
  static String login = "/login";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND!!!");
      }
    );
    router.define(root, handler: homeHandler);
  }
}