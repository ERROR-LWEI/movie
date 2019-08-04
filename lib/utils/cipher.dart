import 'dart:convert';

import 'package:encrypt/encrypt.dart';

setAesStr(data, String key, String iv) {
  var _key = Key.fromBase64(base64Encode(utf8.encode(key)));
  var _iv = IV.fromBase64(iv);
  var encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
  var pass = encrypter.encrypt(data, iv: _iv);
  return pass.base64;
}

getAesStr(String data, String key, String iv) {
  var _key = Key.fromBase64(base64Encode(utf8.encode(key)));
  var _iv = IV.fromBase64(iv);
  var encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
  var pass = encrypter.decrypt64(data, iv: _iv);
  return pass.toString();
}

encode(data) {
  var iv = 'AAAAAAAAAAAAAAAAAAAAAA==';
  var key = "lemonpai.cn shang hai china lwmc";
  var code = setAesStr(data, key, iv);
  Key.fromBase64(code);
  return code;
}

decode(data) {
  var iv = 'AAAAAAAAAAAAAAAAAAAAAA==';
  var key = "lemonpai.cn shang hai china lwmc";
  return getAesStr(data, key, iv);
}