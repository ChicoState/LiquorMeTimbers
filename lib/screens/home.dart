import 'package:flutter/material.dart';

class LiquorMeTimbers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LiquorMeTimbersState();
  }
}

class LiquorMeTimbersState extends State<LiquorMeTimbers> {
  int _selectedPage = 0;
  final _pageOptions = [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liquor Me Timbers!'),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_drink),
              title: Text('Drinks'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_bar),
              title: Text('Stores'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}