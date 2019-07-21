import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:movie/models/ResponseJson.dart';
import 'package:cookie_jar/cookie_jar.dart';

class HttpDio {
  static final String gettype = "get";
  static final String posttype = "post";
  static final String datatype = "data";
  static final String codetype = "errorcode";
  static HttpDio _instance;
  static HttpDio getInstance() {
    if (_instance == null) {
      _instance = HttpDio();
    }
    return _instance;
  }

  Dio dio;

  HttpDio() {
    dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 10000,
    ));
    dio.interceptors.add(CookieManager(CookieJar()));
    // new PersistCookieJar(dir: "./cookies");
  }

  Future get(String url, Function success, { params, Function error }) async{
    _request(url, success, gettype, params, error);
  }

  Future post(String url, Function success, { params, Function error }) async {
    _request(url, success, posttype, params, error);
  }

  Future _request(String url, Function success, [String method, params, Function error ]) async{
    try {
      Response res;
      if (method == gettype) {
        if (params != null) {
          res = await dio.get(url, queryParameters: params);
        } else {
          res = await dio.get(url);
        }
      } else if (method == posttype) {
        if (params != null) {
          res = await dio.post(url, data: params);
        } else {
          res = await dio.post(url);
        }
      }
      var datajson = new ResponseJson.fromJson(res.data);
      if(success != null) {
        success(datajson);
      }
    } on DioError catch (e) {
      _error(error, e);
      return;
    }
    return;
  }

  _error(Function error, e) {
    if (error != null) {
      error(e);
    }
  }
}

