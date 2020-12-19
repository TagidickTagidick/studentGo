import 'package:flutter/material.dart';

class User {
  final String name, image;

  User({@required this.name, @required this.image});
}

// Demo List of Top Travelers
List<User> topTravelers = [user1, user2, user3, user4];

// demo user
User user1 = User(name: "Ирина", image: "images/avatar.jpg");
User user2 = User(name: "Махад", image: "images/Mahad.jpg");
User user3 = User(name: "Анастасия", image: "images/Anastasia.jpg");
User user4 = User(name: "Дык", image: "images/Dyk.jpg");