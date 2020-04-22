import 'package:flutter/material.dart';

class DrinksCategory extends StatelessWidget {
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
                  title: "Rum",
                  titleColor: Colors.white,
                  gridColor: Colors.redAccent,
                  onPressed: () {
                    // TODO change view appropriately
                  },
                ),
                drinksPage(
                  title: "Whiskey",
                  titleColor: Colors.white,
                  gridColor: Colors.orangeAccent,
                  onPressed: () {
                    // TODO change view appropriately
                  },
                ),
                drinksPage(
                  title: "Tequila",
                  titleColor: Colors.black,
                  gridColor: Colors.greenAccent,
                  onPressed: () {
                    // TODO change view appropriately
                  },
                ),
                drinksPage(
                  title: "Vodka",
                  titleColor: Colors.black,
                  gridColor: Colors.yellowAccent,
                  onPressed: () {
                    // TODO change view appropriately
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // displays the box in the CustomScrollView
  Widget drinksPage({
    @required String title,
    Color titleColor,
    Color gridColor,
    @required Function onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: titleColor ?? Colors.white,
            ),
          ),
        ),
        color: gridColor ?? Colors.redAccent,
      ),
    );
  }
}
