import 'dart:convert';
import 'package:dio/dio.dart';

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
      headers: {},
      connectTimeout: 5000,
      receiveTimeout: 10000,
    ));
  }

  Future get(String url, Function success, { params, Function error }) async{
    _request(url, success, gettype, params, error);
  }

  Future post(String url, Function success, { params, Function error }) async {
    _request(url, success, posttype, params, error);
  }

  Future _request(String url, Function success, [String method, FormData params, Function error ]) async{
    String _error_msg = '';
    int _code;

    try {
      Response res;
      if (method == gettype) {
        if (params != null && params.isNotEmpty) {
          res = await dio.get(url, queryParameters: params);
        } else {
          res = await dio.get(url);
        }
      } else if (method == posttype) {
        if (params != null && params.isNotEmpty) {
          res = await dio.post(url, data: params);
        } else {
          res = await dio.post(url);
        }
      }
      _code = res.statusCode;
      if (_code != 200) {
        _error_msg = '错误码：' + _code.toString() + '，' + res.data.toString();
        _error(error, _error_msg);
        return;
      }

      String data_str = json.encode(res.data);
      Map<String, dynamic> dataMap = json.decode(data_str);
      if (dataMap != null && dataMap[codetype] != 0) {
        _error_msg = '错误码：' + dataMap[codetype].toString() + '，' + res.data.toString();
        _error(error, _error_msg);
        return;
      }
      if(success != null) {
        success(dataMap[datatype]);
      }
    } catch (e) {
      _error(error, e.toString());
    }
  }

  _error(Function error, String msg) {
    if (error != null) {
      error(msg);
    }
  }
}

