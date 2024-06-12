import 'dart:developer';

import 'package:universal_html/html.dart';

class SessionStorageHelper {
  static Storage sessionStorage = window.sessionStorage;

  static void saveValue(String key, String value) {
    sessionStorage[key] = value;
    log('Saved value ==> $value');
  }

  static String? getValue(String key) {
    log('Gotten value ==> $key');
    return sessionStorage[key];

  }
  static void removeValue(String key) {
    sessionStorage.remove(key);
  }
  static void clearAll(){
    sessionStorage.clear();
  }

}
