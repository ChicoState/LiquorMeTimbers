import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liquor/modules/bar.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  /// Get a stream of a list of bars
  Stream<List<Bar>> barStream() {
    return _db.collection('bars').snapshots().map(
        (list) => list.documents.map((doc) => Bar.fromFirestore(doc)).toList());
  }
}

class UserFavorites {

  final String uid;
  UserFavorites({ this.uid });

  //collection reference
  final CollectionReference favoriteList = Firestore.instance.collection('favorites');

  Future updateFavorite(String one, String two, String three, String four, String five, int size) async {
    return await favoriteList.document(uid).setData({
      'one' : one,
      'two': two,
      'three': three,
      'four': four,
      'five': five,
      'size' : size,
    });
  }
}
