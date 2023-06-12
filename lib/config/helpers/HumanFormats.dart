import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(int value) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(value);

    return formattedNumber;
  }
}
