import 'package:flutter/material.dart';

class CConfig {
  CConfig._privateConstructor();    
  static final CConfig _instance = CConfig._privateConstructor();

  factory CConfig() {
    return _instance;
  }

  String token = '';
  String serverUrl = '';

  final Map<String, dynamic> _keys = <String, dynamic>{};

  set(key, value) {
    _keys[key] = value;
  }

  get(key) {
    return _keys[key];
  }

  final white = Colors.white;
  final black = Colors.black;
  
  final grey900 = const Color(0xff212121);
  final grey800 = const Color(0xff424242);
  final grey700 = const Color(0xff616161);
  final grey600 = const Color(0xff757575);
  final grey500 = const Color(0xff9E9E9E);
  final grey400 = const Color(0xffBDBDBD);
  final grey300 = const Color(0xffE0E0E0);
  final grey200 = const Color(0xffEEEEEE);
  final grey100 = const Color(0xffF5F5F5);
  final grey50 = const Color(0xffFAFAFA);  
}
