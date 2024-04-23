import 'package:flutter/foundation.dart';

void printty(dynamic val, {String? logLevel}) {
  if (kDebugMode) {
    debugPrint("==== $logLevel ==== ${val.toString()} ");
  }
}
