import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/models/shoe_model.dart';
import 'package:flutter_shoes/src/pages/shoe_description_page.dart';
import 'package:provider/provider.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;
  const ShoeSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const ShoeDescriptionPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30,
          vertical: fullScreen ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffF8D468),
            borderRadius: !fullScreen
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
          ),
          child: Column(
            children: [
              const _ShoeWithShadow(),
              if (!fullScreen) const _ShoeSizes(),
            ],
          ),
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
          _ShoeSizeBox(number: 9),
          _ShoeSizeBox(number: 9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double number;
  const _ShoeSizeBox({
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: () {
        shoeModel.size = number;
      },
      child: Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: number == shoeModel.size
                  ? const Color(0xffF1A23A)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                if (number == shoeModel.size)
                  const BoxShadow(
                      color: Color(0xffF1A23A),
                      blurRadius: 10,
                      offset: Offset(0, 5))
              ]),
          child: Text(
            number.toString().replaceAll('.0', ''),
            style: TextStyle(
              color: number == shoeModel.size
                  ? Colors.white
                  : const Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow();

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
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
          Image(image: AssetImage(shoeModel.assetImage)),
        ],
      ),
    );
  }
}
