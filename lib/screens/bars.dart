import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BarsPage extends StatefulWidget {
  @override
  _BarsPageState createState() => _BarsPageState();
}

class _BarsPageState extends State<BarsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('bars').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Text(
        document['name'],
      ),
    );
  }
}
