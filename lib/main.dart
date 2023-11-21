import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/pages/shoe_page.dart';

void main() => runApp(const MyApp());

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
