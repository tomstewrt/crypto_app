String cleanupPriceString(String price) {
  final value = double.parse(price);
  if (value < 100) {
    return value.toStringAsFixed(4);
  } else {
    return value.toStringAsFixed(2);
  }
}
