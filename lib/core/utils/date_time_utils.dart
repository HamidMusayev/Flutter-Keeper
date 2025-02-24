import 'package:flutter/src/material/time.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String weekdayName({String? locale = 'az'}) {
    return DateFormat.EEEE(locale).format(DateTime.now());
  }

  static String monthName({String? locale = 'az'}) {
    return DateFormat.MMMM(locale).format(DateTime.now());
  }

  static String dayAndMonthName({DateTime? dateTime, String? locale = 'az'}) {
    return DateFormat('d MMMM y', locale).format(dateTime ??= DateTime.now());
  }

  static String dayMonthYear({DateTime? dateTime, String? locale = 'az'}) {
    return DateFormat('dd-MM-yyyy', locale).format(dateTime ??= DateTime.now());
  }

  static String hourMinute({required TimeOfDay time}) {
    return '${time.hour}:${time.minute}';
  }
}
