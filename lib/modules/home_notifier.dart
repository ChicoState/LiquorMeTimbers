import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeNotifier with ChangeNotifier {
  // index for navigating bottom appbar tabs
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;
  void updateSelectedPage(int index) {
    _selectedPage = index;
    notifyListeners();
  }
}
