import 'package:flutter/material.dart';
import 'package:liquor/providers/home_notifier.dart';
import 'package:liquor/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:liquor/services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liquor/screens/home/favoriteBars.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 50.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Favorite Bars',
            ),
            onPressed: () async {
              return Favorites();
            },
          ),
          RaisedButton(
            child: Text(
              'Favorite Drinks',
            ),
            onPressed: () async {

            },
          ),
          RaisedButton(
            child: Text(
              'Change Email',
            ),
            onPressed: () async {

            },
          ),
          RaisedButton(
            child: Text(
              'Change Password',
            ),
            onPressed: () async {

            },
          ),
          RaisedButton(
          child: Text(
            'Logout',
          ),
          onPressed: () async {
            // sign user out
            await _auth.signOut();
            // set selected page to Bars tab so user will be taken to this page
            // when they log back in
            Provider.of<HomeNotifier>(context, listen: false)
                .updateSelectedPage(1);
          },
        ),

    ],
        ),
      ),
    );
    /*return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 50.0,
      ),
      child: RaisedButton(
        child: Text(
          'Logout',
        ),
        onPressed: () async {
          // sign user out
          await _auth.signOut();
          // set selected page to Bars tab so user will be taken to this page
          // when they log back in
          Provider.of<HomeNotifier>(context, listen: false)
              .updateSelectedPage(1);
        },
      ),
    );*/
  }
}
