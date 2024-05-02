import 'package:intl/intl.dart';

class formatNumber {
  static String formatter(int numOfSold) {
    if (numOfSold >= 1000) {
      double soldInK = numOfSold / 1000;
      return '${soldInK.toStringAsFixed(2)}K';
    } else {
      return '$numOfSold';
    }
  }
  static String formatMoney(int money) {
    NumberFormat formatted = NumberFormat("#,###", "en_US");
    return formatted.format(money);
  }
}