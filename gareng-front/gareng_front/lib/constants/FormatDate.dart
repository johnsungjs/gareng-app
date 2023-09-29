import 'package:intl/intl.dart';

class FormatDate {
  static String convertIndo(final String date) {
    return DateFormat('dd MMMM yyyy').format(DateTime.parse(date));
  }
}
