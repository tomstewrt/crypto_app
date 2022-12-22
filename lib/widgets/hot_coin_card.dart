import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HotCoinCard extends StatefulWidget {
  const HotCoinCard({super.key});

  @override
  State<HotCoinCard> createState() => _HotCoinCardState();
}

class _HotCoinCardState extends State<HotCoinCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 225,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bitcoin'),
          ],
        ),
      ),
    );
  }
}
