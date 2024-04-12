// Currency class to format currency values

class CurrencyFormatter {
  static String formatToGermanCurrency(double value) {
    // Format numbers according to the European style (e.g., 1.299,00 €).
    return '${value.toStringAsFixed(2).replaceAll('.', ',')} €';
  }
}
