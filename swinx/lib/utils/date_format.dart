import 'dart:io';

import 'package:intl/intl.dart';

class SwinxDateFormat {
  static String tweetDateFormat(String date) {
    final formatter = DateFormat('dd MMM');
    DateTime dateToConvert;

    try {
      dateToConvert = DateTime.parse(date);
    } on Exception catch (error) {
      print(error);
    }

    try {
      dateToConvert = HttpDate.parse(date);
      return formatter.format(dateToConvert);
    } on Exception {}

    try {
      final String month = date.substring(4, 7);
      final String day = date.substring(8, 10);

      return '$day $month';
    } on Exception catch (error) {
      print(error);
    }

    return date;
  }
}
