import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

import '../../../core/network/dio_exceptions.dart';
import '../../../core/network/endpoints.dart';
import '../../models/coin.dart';

class CoinsApi {
  static Options coinRankingOptions = Options(
    headers: {
      'X-RapidAPI-Key': dotenv.env['RAPIDAPI_KEY'],
      'X-RapidAPI-Host': 'coinranking1.p.rapidapi.co',
    },
  );

  static Future<List<Coin>> fetchTopMarketCapCoins() async {
    try {
      final res = await Dio().get(
        Endpoints.kTopMarketCap,
        options: coinRankingOptions,
        queryParameters: {
          'referenceCurrencyUuid': 'yhjMzLPhuIDl',
          'timePeriod': '24h',
          'tiers[0]': '1',
          'orderBy': 'marketCap',
          'orderDirection': 'desc',
          'limit': 50,
          'offset': 0,
        },
      );
      List<Coin> coins = [];
      final coinData = res.data['data']['coins'];
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
