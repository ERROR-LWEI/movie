import "package:fluro/fluro.dart";
import "package:flutter/material.dart";
import "package:movie/widget/User/User.dart";

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new UserPage();
  }
);