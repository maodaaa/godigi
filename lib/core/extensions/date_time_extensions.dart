import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String toShortDateString() {
    final formatter = DateFormat('d MMM, yyyy');
    return formatter.format(this);
  }

  static DateTime fromShortDateString(String dateString) {
    final formatter = DateFormat('d MMM, yyyy');
    return formatter.parse(dateString);
  }
}
