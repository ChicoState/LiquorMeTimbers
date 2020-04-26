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

class UserData {
  final String uid;
  UserData({this.uid});

  //collection reference
//  final CollectionReference favoriteList =
//      Firestore.instance.collection('favorites');
  final CollectionReference currentUser =
      Firestore.instance.collection('users');

  Future updateFavorite(
      Map<String, String> bars, Map<String, String> drinks) async {
//    return await favoriteList.document(uid).setData({
//    'bars': bars,
//    'drinks': drinks,
//  });
    return await currentUser.document(uid).collection('favorites').add({
      'bars': bars,
      'drinks': drinks,
    });
  }

  Future updateUserEmail(String email) async {
    return await currentUser.document(uid).setData({
      'email': email,
    });
  }

  //get favorites stream

  Stream<QuerySnapshot> get favorites {
    return currentUser.snapshots();
  }
}
