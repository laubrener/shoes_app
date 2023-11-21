import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/models/shoe_model.dart';
import 'package:flutter_shoes/src/pages/shoe_page.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ShoeModel())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ShoePage(),
    );
  }
}
