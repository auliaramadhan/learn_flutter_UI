import 'package:intl/intl.dart';

abstract class AppFormatter {
  static final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

  static String? setCurrency(num number, {empty = false}) {
    try {
      return formatCurrency.format(number);
    } catch (e) {
      print(e);
      return empty ? "" : null;
    }
  }

  static num? getNumCurrency(String number) {
    try {
      return formatCurrency.parse(number);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static final formatDate = DateFormat('yyyy-mm-dd hh : mm');

  static String? objectToStr(DateTime? date) {
    try {
      if (date == null) {
        return null;
      }
      return formatDate.format(date);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static DateTime? strToObject(String? date) {
    try {
      if (date == null) {
        return null;
      }
      return formatDate.parse(date);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
