import 'package:crypto_app/features/coins/coins_api.dart';
import 'package:crypto_app/models/coin.dart';
import 'package:get/get.dart';

enum FilterType {
  marketCap,
  price,
  twentyFourHourChange,
}

enum SortOrder {
  ascending,
  descending,
}

class CoinsController extends GetxController {
  Rx<FilterType> filterType = FilterType.marketCap.obs;
  Rx<SortOrder> sortOrder = SortOrder.descending.obs;
  RxList<Coin> topMarketCapCoins = RxList<Coin>();

  @override
  Future<void> onInit() async {
    await loadTopMarketCapCoins();
    super.onInit();
  }

  Future<void> loadTopMarketCapCoins() async {
    topMarketCapCoins.clear();

    try {
      topMarketCapCoins.value = await CoinsApi.fetchTopMarketCapCoins();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
