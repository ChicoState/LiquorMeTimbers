import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
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
    Hours hours = bar.hours;
    Hours happy = bar.happyHours;

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
          trailing: new Column(
                children: <Widget>[
            new IconButton(
            icon: new Icon(Icons.add_box),
            onPressed: () {
            }),
          ]),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      displayCurrentHours(
                        message: 'Hours',
                        hours: hours,
                        context: context,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                        ),
                        child: displayCurrentHours(
                          message: 'Happy Hours',
                          hours: happy,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                    ),
                    child: Text('Address: ${address.street}, ${address.city}, '
                        '${address.state} ${address.zip}'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget displayCurrentHours(
      {String message, Hours hours, BuildContext context}) {
    DateTime date = DateTime.now();
    String day = DateFormat('EEEE').format(date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('$message: '),
        getCurrentHours(day, hours),
        OutlineButton(
          child: Text('See more hours'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text(message),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Sunday ${hours.Sunday}'),
                        Text('Monday ${hours.Monday}'),
                        Text('Tuesday ${hours.Tuesday}'),
                        Text('Wednesday ${hours.Wednesday}'),
                        Text('Thursday ${hours.Thursday}'),
                        Text('Friday ${hours.Friday}'),
                        Text('Saturday ${hours.Saturday}'),
                      ],
                    )
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget getCurrentHours(String day, Hours hours) {
    switch (day) {
      case 'Sunday':
        return Text('$day ${hours.Sunday}');
      case 'Monday':
        return Text('$day ${hours.Monday}');
      case 'Tuesday':
        return Text('$day ${hours.Tuesday}');
      case 'Wednesday':
        return Text('$day ${hours.Wednesday}');
      case 'Thursday':
        return Text('$day ${hours.Thursday}');
      case 'Friday':
        return Text('$day ${hours.Friday}');
      case 'Saturday':
        return Text('$day ${hours.Saturday}');
    }
    return SizedBox();
  }
}
