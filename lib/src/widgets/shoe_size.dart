import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {
  const ShoeSizePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: const Color(0xffF8D468),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Column(
          children: [
            _ShoeWithShadow(),
            _ShoeSizes(),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShoeSizeBox(number: 7),
          _ShoeSizeBox(number: 7.5),
          _ShoeSizeBox(number: 8),
          _ShoeSizeBox(number: 8.5),
          _ShoeSizeBox(number: 9, selected: true),
          _ShoeSizeBox(number: 9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double number;
  final bool selected;
  const _ShoeSizeBox({
    super.key,
    required this.number,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: selected ? const Color(0xffF1A23A) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (selected)
                const BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ]),
        child: Text(
          number.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 230,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffEAA14E),
                        blurRadius: 40,
                      )
                    ]),
              ),
            ),
          ),
          const Image(image: AssetImage('assets/imgs/azul.png')),
        ],
      ),
    );
  }
}
