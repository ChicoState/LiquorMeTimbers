import 'package:flutter/material.dart';
import 'package:liquor/providers/home_notifier.dart';
import 'package:liquor/screens/bars_screen.dart';
import 'package:liquor/screens/home/profile.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      Text('Item 1'),
      BarsPage(),
      Profile(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Liquor Me Timbers!',
        ),
      ),
      body: _pageOptions[Provider.of<HomeNotifier>(context).selectedPage],
      bottomNavigationBar: Consumer<HomeNotifier>(
        builder: (context, homeNotifier, child) {
          return BottomNavigationBar(
            currentIndex: homeNotifier.selectedPage,
            onTap: (int index) {
              homeNotifier.updateSelectedPage(index);
              print(homeNotifier.selectedPage);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_drink),
                title: Text('Drinks'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_bar),
                title: Text('Bars'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                title: Text('Profile'),
              ),
            ],
          );
        },
      ),
    );
  }
}
