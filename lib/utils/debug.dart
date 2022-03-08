import 'package:flutter/foundation.dart';

class Debug {

  Debug._();

  static void log(dynamic data) {
    if (kDebugMode) {
      print(data);
    }
  }
  // void logd(dynamic data) {
  //   debugPrint(statement);
  //   if (kDebugMode) {
  //     print(data);
  //   }
  // }
  
}