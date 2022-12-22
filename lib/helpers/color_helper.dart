import 'dart:ui';

class ColorHelper {
  static colorFromHex(String hex) {
    return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
