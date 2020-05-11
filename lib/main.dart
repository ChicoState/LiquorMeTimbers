import 'package:flutter/material.dart';
import 'package:liquor/models/user.dart';
import 'package:liquor/screens/wrapper.dart';
import 'package:liquor/services/auth.dart';
import 'package:provider/provider.dart';

import 'providers/home_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => runApp(LiquorMeTimbers());

class LiquorMeTimbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeNotifier(),
        ),
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Wrapper(),
      ),
    );
  }
}
