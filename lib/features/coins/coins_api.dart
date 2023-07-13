import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

import '../../../core/network/dio_exceptions.dart';
import '../../../core/network/endpoints.dart';
import '../../models/coin.dart';

class CoinsApi {
  static Options coinGeckoOptions = Options(
    headers: {
      'X-RapidAPI-Key': dotenv.env['RAPIDAPI_KEY'],
      'X-RapidAPI-Host': 'coingecko.p.rapidapi.com',
    },
  );

  static Future<List<Coin>> fetchTopMarketCapCoins({int page = 1}) async {
    try {
      final res = await Dio().get(
        Endpoints.kTopMarketCap,
        options: coinGeckoOptions,
        queryParameters: {
          'vs_currency': 'usd',
          'order': 'market_cap_desc',
          'page': page,
        },
      );
      List<Coin> coins = [];
      final coinData = res.data['coins'];
      for (var i = 0; i < coinData.length; i++) {
        coins.add(Coin.fromJson(coinData[i]));
      }
      return coins;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
