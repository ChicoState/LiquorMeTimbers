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
    @required this.bar,
  });

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Drink>>.value(
      value: db.drinkStream(),
      child: DrinksAtBarView(
        bar: bar,
      ),
    );
  }
}

class DrinksAtBarView extends StatelessWidget {
  final Bar bar;
  DrinksAtBarView({
    @required this.bar,
  });

  @override
  Widget build(BuildContext context) {
    List<Drink> drinks = Provider.of<List<Drink>>(context);
    if (drinks == null) return Center(child: CircularProgressIndicator());
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kCardRadius),
              ),
            ),
            elevation: kCardElevation,
            margin: EdgeInsets.all(kCardMargin),
            child: Padding(
              padding: const EdgeInsets.all(kCardPadding),
              child: ListTile(
                title: Text(
                  bar.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: drinks.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, drinks[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Drink drink) {
    String name = drink.name;
    String price = drink.price;
    Category category = drink.category;

    // check for null
    if (bar.drinks[drink.documentID] == null) return SizedBox();

    // return a Card if the drink exist at the bar otherwise return SizedBox
    return bar.drinks[drink.documentID]
        ? Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kCardRadius),
              ),
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
          )
        : SizedBox();
  }

  Widget drinkExpansionTile(String name, String price, Category category) {
    List<Widget> categoryWidget = categories(category);
    return ExpansionTile(
      title: Text(
        name,
      ),
      trailing: SizedBox(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Price: $price',
              ),
              categoryWidget.length == 1
                  ? Text(
                      'Category: ',
                    )
                  : Text(
                      'Categories: ',
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categoryWidget,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> categories(Category category) {
    List<Widget> categoryList = [];
    if (category.rum) {
      Widget text = categoryText('Rum');
      categoryList.add(
        text,
      );
    }
    if (category.vodka) {
      Widget text = categoryText('Vodka');
      categoryList.add(
        text,
      );
    }
    if (category.tequila) {
      Widget text = categoryText('Tequila');
      categoryList.add(
        text,
      );
    }
    if (category.whiskey) {
      Widget text = categoryText('Tequila');
      categoryList.add(
        text,
      );
    }
    return categoryList;
  }

  Widget categoryText(String text) {
    return Text(
      text,
    );
  }
}
