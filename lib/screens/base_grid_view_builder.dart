import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Sample GridView.builder to use with database in future
class BaseGridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox();
        },
      ),
    );
  }
}
