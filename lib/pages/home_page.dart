import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/hot_coin_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                'Top Coins',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              ListView.builder(),
            ],
          ),
        ),
      ),
    ));
  }
}
