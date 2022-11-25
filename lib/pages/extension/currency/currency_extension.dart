import 'package:intl/intl.dart';

extension CurrencyExtension on num {
  String toCurrency() {
    final currencyFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return currencyFormat.format(this);
  }
}
