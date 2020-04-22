import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquor/providers/home_notifier.dart';
import 'package:liquor/screens/home/drinks/drinks_by_bar.dart';
import 'package:liquor/screens/home/drinks/drinks_category.dart';
import 'package:provider/provider.dart';

class DrinksPage extends StatelessWidget {
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
                  title: "By\nCategory",
                  titleColor: Colors.white,
                  gridColor: Colors.redAccent,
                  onPressed: () {
                    Provider.of<HomeNotifier>(context, listen: false)
                        .updateDrinkPage(
                      DrinksCategory(),
                    );
                  },
                ),
                drinksPage(
                  title: "By\nBar",
                  titleColor: Colors.white,
                  gridColor: Colors.orangeAccent,
                  onPressed: () {
                    Provider.of<HomeNotifier>(context, listen: false)
                        .updateDrinkPage(
                      DrinksByBar(),
                    );
                  },
                ),
                drinksPage(
                  title: "Most\nPopular",
                  titleColor: Colors.black,
                  gridColor: Colors.greenAccent,
                  onPressed: () {
                    // TODO show drinks based on popularity
                    // TODO change view appropriately
                  },
                ),
                drinksPage(
                  title: "My\nFavorites",
                  titleColor: Colors.black,
                  gridColor: Colors.yellowAccent,
                  onPressed: () {
                    // TODO add favorites functionality for authenticated users
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
