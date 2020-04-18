import 'package:flutter/material.dart';
import 'package:liquor/providers/home_notifier.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageOptions = Provider.of<HomeNotifier>(context).pageOptions;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          'Liquor Me Timbers!',
          style: TextStyle(
            fontFamily: 'lobster',
          ),
        ),
        actions: <Widget>[
          Visibility(
            visible: Provider.of<HomeNotifier>(context).visible,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 12.0,
              ),
              child: IconButton(
                tooltip: 'Home',
                icon: Icon(Icons.home),
                onPressed: () {
                  Provider.of<HomeNotifier>(
                    context,
                    listen: false,
                  ).setHomeDrinkPage();
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/drink3.png'),
          fit: BoxFit.fitWidth,
        )),
        child: _pageOptions[Provider.of<HomeNotifier>(context).selectedPage],
      ),
      bottomNavigationBar: Consumer<HomeNotifier>(
        builder: (context, homeNotifier, child) {
          return BottomNavigationBar(
            backgroundColor: Colors.grey[900],
            currentIndex: homeNotifier.selectedPage,
            onTap: (int index) {
              homeNotifier.updateSelectedPage(index);
              print(homeNotifier.selectedPage);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_bar, color: Colors.red[900]),
                title: Text('Drinks', style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store, color: Colors.red[900]),
                title: Text('Bars',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box, color: Colors.red[900]),
                title: Text('Profile', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}
