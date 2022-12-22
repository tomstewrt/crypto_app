import 'package:crypto_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const HomePage(),
    );
  }
}
