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
  UserFavorites({this.uid});

  final CollectionReference userData =
      Firestore.instance.collection('userData');

  Future updateUserData(
      List<String> favoriteBars, List<String> favoriteDrinks) async {
    return await userData.document(uid).setData({
      'favorite_bars': favoriteBars,
      'favorite_drinks': favoriteDrinks,
    });
  }
}
