// import 'package:fl_chart/fl_chart.dart';
import 'package:crypto_app/controllers/coins_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/hot_coin_card.dart';

class HomeView extends StatelessWidget {
  final CoinsController coinsController = Get.find();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Theme.of(context).primaryColor,
                      size: 36,
                    ),
                  ],
                ),
                // Hot coins section
                Text(
                  'Hot Coins',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 160,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      HotCoinCard(),
                      HotCoinCard(),
                    ],
                  ),
                ),
                // Top 25 coins section
                Text(
                  'Top Market Cap',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Obx(
                  () {
                    final topCoins = coinsController.topMarketCapCoins;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: topCoins.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading: SizedBox(
                            width: 35,
                            height: 35,
                            child: SvgPicture.network(
                              topCoins[index].iconUrl,
                            ),
                          ),
                          title: Text(topCoins[index].name),
                          subtitle: Text(topCoins[index].symbol),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(topCoins[index].price),
                              Text(topCoins[index].marketCap),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
