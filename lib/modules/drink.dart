import 'package:cloud_firestore/cloud_firestore.dart';

///
/// Drink class
/// creates an object from data in Cloud Firestore database
///
class Drink {
  final String name;
  final int favoriteCount;
  final bool happyHour;
  final String price;
  final Category category;
  final String documentID;

  Drink({
    this.name,
    this.favoriteCount,
    this.happyHour,
    this.price,
    this.category,
    this.documentID,
  });

  factory Drink.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map data = documentSnapshot.data;
    return Drink(
      name: data['name'] ?? '',
      favoriteCount: data['favorite_count'] ?? 0,
      happyHour: data['happy_hour'] ?? false,
      price: data['price'] ?? '',
      category: data['Category'],
      documentID: documentSnapshot.documentID,
    );
  }
}

///
/// Category class
/// category object from Cloud Firestore data for each Drink
///
class Category {
  final bool rum;
  final bool vodka;
  final bool tequila;
  final bool whiskey;

  Category({
    this.rum,
    this.vodka,
    this.tequila,
    this.whiskey,
  });

  factory Category.fromMap(Map data) {
    return Category(
      rum: data['rum'] ?? false,
      vodka: data['vodka'] ?? false,
      tequila: data['tequila'] ?? false,
      whiskey: data['whiskey'] ?? false,
    );
  }
}
