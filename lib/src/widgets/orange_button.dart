import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  const OrangeButton(
      {super.key,
      required this.text,
      this.height = 50,
      this.width = 150,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
