import 'package:flutter/material.dart';

class GestureProvider extends ChangeNotifier{
  double _gap = 0;

  double get degree => _gap * .8;
  double get gap => _gap;
  set setGap(double gap){
    _gap = gap;
    notifyListeners();
  }

}