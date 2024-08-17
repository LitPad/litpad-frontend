import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

void printty(dynamic val, {String? logLevel}) {
  if (kDebugMode) {
    // log("==== $logLevel ==== ${val.toString()} ");
    if (val is Map || val is List) {
      log('====$logLevel==== ${jsonEncode(val)}');
    } else {
      log(val.toString());
    }
  }
}
