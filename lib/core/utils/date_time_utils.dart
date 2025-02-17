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
}
