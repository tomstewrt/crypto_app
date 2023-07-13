import 'dart:ui';

import 'package:crypto_app/helpers/common_utils.dart';

import '../helpers/color_helper.dart';

class Coin {
  final String uuid;
  final String symbol;
  final String name;
  final Color? color;
  final String iconUrl;
  final String marketCap;
  final String price;
  final String change;
  final List<String> sparkline;
  final String volume24h;

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
        color = data['color'] == null
            ? null
            : ColorHelper.colorFromHex(data['color']),
        iconUrl = data['iconUrl'],
        marketCap = cleanupPriceString(data['marketCap']),
        price = cleanupPriceString(data['price']),
        change = data['change'],
        sparkline = List.castFrom(data['sparkline']),
        volume24h = cleanupPriceString(data['24hVolume']);
}
