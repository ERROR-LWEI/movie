import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:movie/app.dart';
import 'package:movie/config/application.dart';
import 'package:movie/config/routes.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(App());
}
