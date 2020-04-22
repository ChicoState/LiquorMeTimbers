import 'package:flutter/material.dart';
import 'package:liquor/modules/bar.dart';
import 'package:liquor/services/db.dart';
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
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            // TODO create Widget that takes in a bar and displays its drinks
            print("Tapped");
//        Provider.of<HomeNotifier>(context).updateDrinkPage(SomeWidget(bar),);
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
