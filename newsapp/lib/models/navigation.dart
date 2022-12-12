import 'package:flutter/cupertino.dart';

class NavigationModel with ChangeNotifier {
  int _actualPage = 0;
  final PageController _pageController = PageController();

  int get actualPage => _actualPage;
  PageController get pageController => _pageController;

  set actualPage(int value) {
    _actualPage = value;
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  void nextPage() {
    _actualPage++;
  }

  void previousPage() {
    _actualPage--;
  }

  void goToPage(int page) {
    _actualPage = page;
  }
}
