import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrinksPage extends StatelessWidget {
  final List<String> selectionTitles = [
    "By\nCategory",
    "By\nBar",
    "Most\nPopular",
    "My\nFavorites",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 340,
              children: <Widget>[
                drinksPage(
                  selectionTitles.first,
                  Colors.white,
                  Colors.redAccent,
                ),
                drinksPage(
                  selectionTitles[1],
                  Colors.white,
                  Colors.orangeAccent,
                ),
                drinksPage(
                  selectionTitles[2],
                  Colors.black,
                  Colors.greenAccent,
                ),
                drinksPage(
                  selectionTitles[3],
                  Colors.black,
                  Colors.yellowAccent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // displays the box in the CustomScrollView
  Widget drinksPage(String title, Color textColor, Color gridColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: textColor,
          ),
        ),
      ),
      color: gridColor,
    );
  }
}
