import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/helpers/helpers.dart';
import 'package:flutter_shoes/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusDark();

    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            text: 'For you',
          ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ShoeSizePreview(),
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          )),
          AddCartButton(amount: 180.0),
        ],
      ),
    );
  }
}
