import 'dart:convert';
import 'dart:typed_data';

import 'package:common_control/cconfig.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Http {
  static makeParams(Map<String, dynamic>? items, [String? etc]) {
    if (items == null) {
      return '';
    }

    var params = '';
    for (String key in items.keys) {
      if (params != '') {
        params += '&';
      }

      params += '$key=${items[key]}';
    }

    if (etc != null && etc != '') {
      if (params != '') {
        params += '&';
      }

      params += etc;
    }

    return params;
  }

  static get(String path, [Map<String, dynamic>? params, String? etc]) async {
    var param = makeParams(params, etc);

    final config = CConfig();

    try {
      var url = '${config.serverUrl}$path';      
      if (param != '') {
        url += '?$param';
      }

      var result = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer ${config.token}'});
      if (result.statusCode == 200) {        
        final parsed = json.decode(utf8.decode(result.bodyBytes));
        return parsed;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }

  static post(String path, Object item) async {
    final config = CConfig();

    try {
      var result = await http.post(Uri.parse('${config.serverUrl}$path'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${config.token}'
          },
          body: jsonEncode(item));
      if (result.statusCode == 200) {
        return json.decode(utf8.decode(result.bodyBytes));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }

  static insert(String path, Object item) async {
    final config = CConfig();

    try {
      var result = await http.post(Uri.parse('${config.serverUrl}$path'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${config.token}'
          },
          body: jsonEncode(item));
      if (result.statusCode == 200) {
        final parsed = json.decode(utf8.decode(result.bodyBytes));
        return parsed["id"];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return 0;
  }

  static put(String path, Object item) async {
    final config = CConfig();

    try {
      var result = await http.put(Uri.parse('${config.serverUrl}$path'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${config.token}'
          },
          body: jsonEncode(item));
      if (result.statusCode == 200) {
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static delete(String path, Object item) async {
    final config = CConfig();

    try {
      var result = await http.delete(Uri.parse('${config.serverUrl}$path'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${config.token}'
          },
          body: jsonEncode(item));
      if (result.statusCode == 200) {}
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static upload(String url, String name, String path) async {
    final config = CConfig();

    Map<String, String> headers = {
      'Authorization': "Bearer ${config.token}"
    };

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('${config.serverUrl}$url'));
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath(name, path));

    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      var responseData = await json.decode(utf8.decode(responsed.bodyBytes));

      return responseData['filename'];
    }

    return '';
  }

  // 파일(PDF 등)을 바이트로 받는다. 실패하면 빈 바이트
  static Future<Uint8List> download(String path,
      [Map<String, dynamic>? params]) async {
    var param = makeParams(params);

    final config = CConfig();

    try {
      var url = '${config.serverUrl}$path';
      if (param != '') {
        url += '?$param';
      }

      var result = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer ${config.token}'});
      if (result.statusCode == 200) {
        return result.bodyBytes;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return Uint8List(0);
  }

  // upload 의 웹판 — 웹에는 파일 경로가 없어 바이트와 파일명(확장자 포함)으로 올린다. 서버가 저장한 파일명을 돌려준다
  static Future<String> uploadWeb(
      String url, String name, Uint8List bytes, String filename) async {
    final config = CConfig();

    try {
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse('${config.serverUrl}$url'));
      request.headers.addAll({'Authorization': 'Bearer ${config.token}'});
      request.files.add(http.MultipartFile.fromBytes(name, bytes,
          filename: filename.split('/').last));

      var response = await request.send();
      var responsed = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        var responseData = json.decode(utf8.decode(responsed.bodyBytes));

        return responseData['filename'] ?? '';
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return '';
  }
}
