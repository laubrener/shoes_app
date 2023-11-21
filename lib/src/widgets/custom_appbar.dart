import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Icon(Icons.search, size: 30),
          ],
        ),
      ),
    );
  }
}
