import 'package:flutter/material.dart';
import 'package:liquor/screens/home/profile.dart';
import 'package:liquor/services/auth.dart';
import 'package:liquor/services/db.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liquor/screens/home/fave_list.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: UserData().users,
      child: Scaffold(
        body: FaveList(),
        child: RaisedButton(
          child: Text(
            'Back',
          ),
          onPressed: () async {
            return Profile();
          },
        ),
      ),
    );
  }
}
