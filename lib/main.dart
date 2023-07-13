import 'package:crypto_app/controllers/coins_controller.dart';
import 'package:crypto_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // put controllers
    Get.put(CoinsController());

    return GetMaterialApp(
      title: 'Crypto App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        fontFamily: 'NotoSans',
      ),
      home: HomeView(),
    );
  }
}
