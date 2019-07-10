import 'package:flutter/material.dart';
import 'package:movie/config/application.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      onGenerateRoute: Application.router.generator,
    );
  }
}