import 'package:intl/intl.dart';

class DateTimeUtils{
  static String weekdayName({String? locale = 'az'}) {
    return DateFormat.EEEE(locale).format(DateTime.now());
  }

  static String monthName({String? locale = 'az'}) {
    return DateFormat.MMMM(locale).format(DateTime.now());
  }
}