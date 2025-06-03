import 'package:flutter/foundation.dart';

class SliderProvider extends ChangeNotifier {
  double _sliderValue = 0.5;

  double get sliderValue => _sliderValue;

  void updateSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }
}
