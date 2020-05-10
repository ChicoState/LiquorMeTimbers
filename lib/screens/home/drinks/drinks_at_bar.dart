import 'package:flutter/material.dart';
import 'package:liquor/modules/bar.dart';
import 'package:liquor/modules/drink.dart';
import 'package:liquor/services/db.dart';
import 'package:liquor/utilities/constants.dart';
import 'package:provider/provider.dart';

class DrinksAtBar extends StatelessWidget {
  final db = DatabaseService();
  final Bar bar;

  DrinksAtBar({
    this.bar,
  });

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Drink>>.value(
      value: db.drinkStream(),
      child: DrinksAtBarView(),
    );
  }
}

class DrinksAtBarView extends StatelessWidget {
  final Bar bar;
  DrinksAtBarView({this.bar});

  @override
  Widget build(BuildContext context) {
    List<Drink> drinks = Provider.of<List<Drink>>(context);
    if (drinks == null) return Center(child: CircularProgressIndicator());
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kCardRadius)),
            ),
            elevation: kCardElevation,
            margin: EdgeInsets.all(kCardMargin),
            child: Padding(
              padding: const EdgeInsets.all(kCardPadding),
              child: ListTile(
                title: Text(
                  bar.name,
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: drinks.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, drinks[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Drink drink) {
    String name = drink.name;
    String price = drink.price;
    Category category = drink.category;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kCardRadius)),
      ),
      elevation: kCardElevation,
      margin: EdgeInsets.all(kCardMargin),
      child: Padding(
        padding: const EdgeInsets.all(kCardPadding),
        child: drinkExpansionTile(
          name,
          price,
          category,
        ),
      ),
    );
  }

  Widget drinkExpansionTile(
    String name,
    String price,
    Category category,
  ) {
    return ExpansionTile(
      title: Text(
        name,
      ),
      trailing: SizedBox(),
      children: <Widget>[],
    );
  }
}
