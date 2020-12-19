import 'package:flutter/material.dart';
import 'user.dart';

class TravelSpot {
  final String name, image;
  final DateTime date;
  final List<User> users;

  TravelSpot({
    @required this.users,
    @required this.name,
    @required this.image,
    @required this.date,
  });
}

List<TravelSpot> travelSpots = [
  TravelSpot(
    users: users..shuffle(),
    name: "Волонтёрское направление",
    image: "images/волонтерское_направление.jpg",
    date: DateTime(2020, 10, 15),
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "Спортивное направление",
    image: "images/спортивное_направление.jpg",
    date: DateTime(2020, 3, 10),
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "Технохакатон",
    image: "images/techhack.jpg",
    date: DateTime(2020, 10, 15),
  ),
];

List<User> users = [user1, user2, user3];