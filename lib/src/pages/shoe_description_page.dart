import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/helpers/helpers.dart';
import 'package:provider/provider.dart';
import '../models/shoe_model.dart';
import '../widgets/custom_widgets.dart';
import 'package:animate_do/animate_do.dart';

class ShoeDescriptionPage extends StatelessWidget {
  const ShoeDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          const Hero(tag: 'Zapato-1', child: ShoeSizePreview(fullScreen: true)),
          Positioned(
              top: 80,
              child: FloatingActionButton(
                onPressed: () {
                  changeStatusDark();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                highlightElevation: 0,
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 60,
                ),
              ))
        ]),
        const Expanded(
            child: SingleChildScrollView(
          child: Column(children: [
            ShoeDescription(
              title: 'Nike Air Max 720',
              description:
                  "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
            ),
            _BuyNow(),
            _ColorsAndMore(),
            _Buttons()
          ]),
        ))
      ],
    ));
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadowButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
          ),
          _ShadowButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _ShadowButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  final Icon icon;
  const _ShadowButton({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10),
            )
          ]),
      child: icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 90,
                    child: _ColorButton(
                      index: 1,
                      color: Color(0xffC6D642),
                      urlImage: 'assets/imgs/verde.png',
                    )),
                Positioned(
                    left: 60,
                    child: _ColorButton(
                      index: 2,
                      color: Color(0xffFFAD29),
                      urlImage: 'assets/imgs/amarillo.png',
                    )),
                Positioned(
                    left: 30,
                    child: _ColorButton(
                      index: 3,
                      color: Color(0xff2099F1),
                      urlImage: 'assets/imgs/azul.png',
                    )),
                _ColorButton(
                  color: Color(0xff364D56),
                  index: 4,
                  urlImage: 'assets/imgs/negro.png',
                ),
              ],
            ),
          ),
          OrangeButton(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xffFFC675),
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImage;
  const _ColorButton({
    required this.color,
    this.index = 1,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  const _BuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(children: [
          const Text(
            '\$180.0',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Bounce(
            delay: const Duration(seconds: 1),
            from: 8,
            child: const OrangeButton(
              text: 'Buy now',
              height: 40,
              width: 120,
            ),
          )
        ]),
      ),
    );
  }
}
