import 'package:flutter/material.dart';

class PageIndexProvider with ChangeNotifier {
  int _pageIndex = 0;
  final PageController _pageController = PageController();

  int get pageIndex => _pageIndex;
  PageController get pageController => _pageController;

  void setPageIndex(int index) {
    if (_pageIndex != index) {
      _pageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }
}