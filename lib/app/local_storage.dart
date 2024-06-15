import 'dart:convert';
import 'dart:developer';

import 'package:universal_html/html.dart';

import '../core/core.dart';

class LocalStorageHelper {
  static Storage localStorage = window.localStorage;

  static void saveValue(String key, String value) {
    localStorage[key] = value;
    log('Saved $value');
  }

  static String? getValue(String key) {
    log('Gotten value $key');
    return localStorage[key];

  }
  static void removeValue(String key) {
    localStorage.remove(key);
  }
  static void clearAll(){
    localStorage.clear();
  }
  static void saveUser(User user) {
    saveValue('user', jsonEncode(user.toMap()));
  }

  static User? getUser() {
    String? userJson = getValue('user');
    if (userJson != null) {
      return User.fromMap(jsonDecode(userJson));
    }
    return null;
  }

}
