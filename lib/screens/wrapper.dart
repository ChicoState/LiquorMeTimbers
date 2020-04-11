import 'package:flutter/material.dart';
import 'package:liquor/screens/auth/authenticate.dart';
import 'package:liquor/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:liquor/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    //return either Home or Auth widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
