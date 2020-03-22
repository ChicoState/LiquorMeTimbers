import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text(
            document['name'],
          ),
          trailing: SizedBox(),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(document['address']['street']),
                Row(
                  children: <Widget>[
                    Text('${document['address']['city']}, '),
                    Text('${document['address']['state']} '),
                    Text(document['address']['zip']),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
