import 'package:cloud_firestore/cloud_firestore.dart';

class Bar {
  final String name;
  final Address address;

  Bar({this.name, this.address});

  factory Bar.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map data = documentSnapshot.data;

    return Bar(
      name: data['name'] ?? '',
      address: Address.fromMap(data['address']),
    );
  }

//  factory Bar.fromMap(Map data) {
//    data = data ?? {};
//    return Bar(
//      name: data['name'] ?? '',
//      address: Address.fromMap(data['address']),
//    );
//  }
}

class Address {
  final String city;
  final String state;
  final String street;
  final String zip;

  Address({this.city, this.state, this.street, this.zip});

  factory Address.fromMap(Map data) {
    return Address(
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      street: data['street'] ?? '',
      zip: data['zip'] ?? '',
    );
  }
}
