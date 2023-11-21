import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _asetImage = 'assets/imgs/azul.png';
  double _size = 9.0;

  String get assetImage => _asetImage;
  set assetImage(String value) {
    _asetImage = value;
    notifyListeners();
  }

  double get size => _size;
  set size(double value) {
    _size = value;
    notifyListeners();
  }
}
