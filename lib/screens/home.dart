import 'package:flutter/material.dart';
import 'package:liquor/providers/home_notifier.dart';
import 'package:liquor/screens/bars_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    int _selectedPage = 0;
    final _pageOptions = [
      Text('Item 1'),
      BarsPage(),
      Text('Item 3'),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Liquor Me Timbers!',
        ),
      ),
//      body: _pageOptions[_selectedPage],
      body: _pageOptions[Provider.of<HomeNotifier>(context).selectedPage],
      bottomNavigationBar:
          Consumer<HomeNotifier>(builder: (context, homeNotifier, child) {
        return BottomNavigationBar(
//            currentIndex: selectedPage,
          currentIndex: homeNotifier.selectedPage,

          onTap: (int index) {
            homeNotifier.updateSelectedPage(index);
            print(homeNotifier.selectedPage);
//              setState(() {
//                _selectedPage = index;
//              });
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
      }),
    );
  }
}
