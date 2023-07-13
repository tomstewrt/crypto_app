import 'dart:ui';

import '../helpers/color_helper.dart';

class Coin {
  final String uuid;
  final String symbol;
  final String name;
  final Color color;
  final String iconUrl;
  final double marketCap;
  final double price;
  final String change;
  final List<double> sparkline;
  final double volume24h;

  Coin(
    this.uuid,
    this.symbol,
    this.name,
    this.color,
    this.iconUrl,
    this.marketCap,
    this.price,
    this.change,
    this.sparkline,
    this.volume24h,
  );

  Coin.fromJson(Map<String, dynamic> data)
      : uuid = data['uuid'],
        symbol = data['symbol'],
        name = data['name'],
        color = ColorHelper.colorFromHex(data['color']),
        iconUrl = data['iconUrl'],
        marketCap = data['marketCap'],
        price = data['price'],
        change = data['change'],
        sparkline = List.castFrom(data['sparkline']),
        volume24h = data['volume24h'];
}
