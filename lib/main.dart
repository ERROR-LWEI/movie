import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:movie/app.dart';
import 'package:movie/config/application.dart';
import 'package:movie/config/routes.dart';
// import 'package:movie/widget/Layout.dart';
// import 'package:movie/widget/User/Login.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(App());
}

// class MyApp extends StatelessWidget {

//   @override
//   Widget build (BuildContext context) {

//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: new ThemeData(
//         primaryColor: Colors.green,
//       ),
//       home:new Login(),
//     );
//   }
// }
