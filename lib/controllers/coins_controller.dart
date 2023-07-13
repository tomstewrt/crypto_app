import 'package:crypto_app/features/coins/coins_api.dart';
import 'package:crypto_app/models/coin.dart';
import 'package:get/get.dart';

enum FilterType {
  marketCap,
  price,
  twentyFourHourChange,
}

class CoinsController extends GetxController {
  List<Coin> topMarketCapCoins = [];

  @override
  Future<void> onInit() async {
    await loadTopMarketCapCoins();
    super.onInit();
  }

  Future<void> loadTopMarketCapCoins() async {
    topMarketCapCoins.clear();

    try {
      topMarketCapCoins = await CoinsApi.fetchTopMarketCapCoins();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
