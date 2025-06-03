import 'package:flutter/material.dart';

class ProductScrollProvider extends ChangeNotifier {
  bool _isAppBarExpanded = false;
  int _currentImagePage = 1;

  bool get isAppBarExpanded => _isAppBarExpanded;
  int get currentImagePage => _currentImagePage;

  void updateAppBarState(bool isExpanded) {
    if (_isAppBarExpanded != isExpanded) {
      _isAppBarExpanded = isExpanded;
      notifyListeners();
    }
  }

  void updateImagePage(int currentPage) {
    if (_currentImagePage != currentPage) {
      _currentImagePage = currentPage;
      notifyListeners();
    }
  }
}
