import 'package:flutter/material.dart';

class PrivacyChatSelection extends ChangeNotifier {
  int _selectedButton = 0;

  int get selectedButton => _selectedButton;

  void setSelectedButton(int index) {
    _selectedButton = index;
    notifyListeners();
  }
}
