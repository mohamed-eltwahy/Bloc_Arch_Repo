import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static Future<String> getSavedString(String value, defaultVal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedValue = prefs.getString(value) ?? defaultVal;
    log('userData ${savedValue.toString()}');
    return savedValue;
  }

// Store String data
  static Future<bool> setSavedString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedValue = await prefs.setString(key, value);
    return savedValue;
  }

  static Future<dynamic> setJsonObject(String key, dynamic jsonObject) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(jsonObject));
     log('ddddddd${jsonObject.toString()}');
    return json.encode(jsonObject);
  }

static  Future<dynamic> getJsonObject(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedJson = prefs.getString(key);
    log('userData ${encodedJson.toString()}');
    return json.decode(encodedJson!);
  }

  static Future logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
