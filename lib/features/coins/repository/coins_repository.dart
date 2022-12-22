import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/network/dio_exceptions.dart';
import '../../../models/crypto_coin.dart';
import '../api/coins_api.dart';

class CoinsRepository {
  final CoinsApi _coinsApi;

  CoinsRepository(this._coinsApi);

  Future<List<CryptoCoin>> fetchTopCoins() async {}
}
