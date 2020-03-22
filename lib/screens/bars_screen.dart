import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:liquor/modules/bar.dart';
import 'package:liquor/services/db.dart';
import 'package:provider/provider.dart';

class BarsPage extends StatelessWidget {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Bar>>.value(
      value: db.barStream(),
      child: BarList(),
    );
  }
}

class BarList extends StatelessWidget {
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
    Address address = bar.address;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text(
            bar.name,
          ),
          trailing: SizedBox(),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(address.street),
                Row(
                  children: <Widget>[
                    Text('${address.city}, '),
                    Text('${address.state} '),
                    Text(address.state),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
