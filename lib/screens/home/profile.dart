import 'package:flutter/material.dart';
import 'package:liquor/providers/home_notifier.dart';
import 'package:liquor/services/auth.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
