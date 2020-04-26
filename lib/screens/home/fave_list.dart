import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FaveList extends StatefulWidget {
  @override
  _FaveListState createState() => _FaveListState();
}

class _FaveListState extends State<FaveList> {
  @override
  Widget build(BuildContext context) {

    final Fave = Provider.of<QuerySnapshot>(context);
    //print(users);
    for(var doc in users.documents) {
      print(doc.data);
    }
    return Container();
  }
}
