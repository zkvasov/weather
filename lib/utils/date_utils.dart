import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String getMonthDayString() {
    return DateFormat('dd.MM').format(this);
  }

  String getMonthDayTimeString() {
    return DateFormat('dd-MM – kk:mm').format(this);
  }

  String getFormattedFullDateTimeString() {
    return DateFormat('yyyy-MM-dd – kk:mm').format(this);
  }
}
