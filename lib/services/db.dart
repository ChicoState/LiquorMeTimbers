import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liquor/modules/bar.dart';
import 'package:liquor/modules/drink.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  /// Get a stream of a list of bars
  Stream<List<Bar>> barStream() {
    return _db.collection('bars').snapshots().map(
        (list) => list.documents.map((doc) => Bar.fromFirestore(doc)).toList());
  }

  /// Get a stream of a list of drinks
  Stream<List<Drink>> drinkStream() {
    return _db.collection('drinks').snapshots().map((list) =>
        list.documents.map((doc) => Drink.fromFirestore(doc)).toList());
  }
}
