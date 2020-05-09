import 'package:flutter/material.dart';
import 'package:liquor/modules/bar.dart';
import 'package:liquor/providers/home_notifier.dart';
import 'package:liquor/screens/home/drinks/drinks_at_bar.dart';
import 'package:liquor/services/db.dart';
import 'package:liquor/utilities/constants.dart';
import 'package:provider/provider.dart';

class DrinksByBar extends StatelessWidget {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Bar>>.value(
      value: db.barStream(),
      child: DrinksByBarView(),
    );
  }
}

class DrinksByBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Bar> bars = Provider.of<List<Bar>>(context);
    if (bars == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
      itemCount: bars.length,
      itemBuilder: (context, index) => _buildListItem(context, bars[index]),
    );
  }

  Widget _buildListItem(BuildContext context, Bar bar) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kCardRadius)),
      ),
      elevation: kCardElevation,
      margin: EdgeInsets.all(kCardMargin),
      child: Padding(
        padding: const EdgeInsets.all(kCardPadding),
        child: ListTile(
          onTap: () {
            print("Tapped");
            Provider.of<HomeNotifier>(context).updateDrinkPage(
              DrinksAtBar(bar: bar),
            );
          },
          title: Text(
            bar.name,
          ),
          trailing: SizedBox(),
        ),
      ),
    );
  }
}
