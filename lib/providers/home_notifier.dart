import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:liquor/screens/home/bars_screen.dart';
import 'package:liquor/screens/home/drinks_screen.dart';
import 'package:liquor/screens/home/profile.dart';

class HomeNotifier with ChangeNotifier {
  // index for navigating bottom appbar tabs
  int _selectedPage = 1;

  // get the selected page index
  int get selectedPage => _selectedPage;

  // update index of selected tab on bottom nav bar
  void updateSelectedPage(int index) {
    _selectedPage = index;
    notifyListeners();
  }

  // list of page options to display on bottom nav bar
  List<Widget> _pageOptions = [
    DrinksPage(),
    BarsPage(),
    Profile(),
  ];

  // get the page options
  UnmodifiableListView get pageOptions {
    return UnmodifiableListView(_pageOptions);
  }

  // update the drink view
  void updateDrinkPage(Widget widget) {
    _pageOptions.first = widget;
    _visible = !_visible;
    notifyListeners();
  }

  // set the drink view back to default page
  void setHomeDrinkPage() {
    _pageOptions.first = DrinksPage();
    _visible = !_visible;
    notifyListeners();
  }

  // whether home button is visible or not
  bool _visible = false;

  // get visibility value
  bool get visible => _visible;

  // toggle visibility
  void toggleVisibility() {
    _visible = !_visible;
    notifyListeners();
  }
}
