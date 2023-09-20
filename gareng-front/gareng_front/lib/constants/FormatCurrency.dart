import 'package:intl/intl.dart';

class FormatCurrency {
  static final indo =
      NumberFormat.currency(locale: 'ID', symbol: "Rp", decimalDigits: 0);
}
