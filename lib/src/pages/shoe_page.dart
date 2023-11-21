import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            text: 'For you',
          ),
          SizedBox(height: 20),
          ShoeSizePreview(),
        ],
      ),
    );
  }
}
