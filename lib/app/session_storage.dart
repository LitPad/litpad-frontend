import 'package:universal_html/html.dart';

class SessionStorageHelper {
  static Storage sessionStorage = window.sessionStorage;

  static void saveValue(String key, String value) {
    sessionStorage[key] = value;
  }

  static String? getValue(String key) {
    return sessionStorage[key];
  }
  static void removeValue(String key) {
    sessionStorage.remove(key);
  }
  static void clearAll(){
    sessionStorage.clear();
  }

}
