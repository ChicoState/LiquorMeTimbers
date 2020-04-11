import 'package:flutter/material.dart';
import 'package:liquor/modules/user.dart';
import 'package:liquor/screens/auth/authenticate.dart';
import 'package:liquor/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    //return either Home or Auth widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
