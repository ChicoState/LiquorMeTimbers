import 'package:flutter/material.dart';
import 'package:liquor/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'modules/home_notifier.dart';

void main() => runApp(LiquorMeTimbers());

class LiquorMeTimbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Home(),
      ),
    );
  }
}
