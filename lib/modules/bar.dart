import 'package:cloud_firestore/cloud_firestore.dart';

class Bar {
  final String name;
  final Address address;
  final Hours hours;
  final Hours happyHours;
  final Map drinks;

  Bar({this.name, this.address, this.hours, this.happyHours, this.drinks});

  factory Bar.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map data = documentSnapshot.data;

    return Bar(
      name: data['name'] ?? '',
      address: Address.fromMap(data['address']),
      hours: Hours.fromMap(data['hours']),
      happyHours: Hours.fromMap(data['happy_hours']),
      drinks: data['drinks'],
    );
  }
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

class Hours {
  final String Sunday;
  final String Monday;
  final String Tuesday;
  final String Wednesday;
  final String Thursday;
  final String Friday;
  final String Saturday;

  Hours(
      {this.Sunday,
      this.Monday,
      this.Tuesday,
      this.Wednesday,
      this.Thursday,
      this.Friday,
      this.Saturday});

  factory Hours.fromMap(Map data) {
    try {
      return Hours(
        Sunday: data['Sunday'] ?? '',
        Monday: data['Monday'] ?? '',
        Tuesday: data['Tuesday'] ?? '',
        Wednesday: data['Wednesday'] ?? '',
        Thursday: data['Thursday'] ?? '',
        Friday: data['Friday'] ?? '',
        Saturday: data['Saturday'] ?? '',
      );
    } catch (e) {
      print(e);
      return Hours(
        Sunday: '',
        Monday: '',
        Tuesday: '',
        Wednesday: '',
        Thursday: '',
        Friday: '',
        Saturday: '',
      );
    }
  }
}
