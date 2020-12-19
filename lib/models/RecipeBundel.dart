import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {this.id,
        this.chefs,
        this.recipes,
        this.title,
        this.description,
        this.imageSrc,
        this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 10,
    recipes: 95,
    title: "Суши вок",
    description: "Скидка на доставку роллов",
    imageSrc: "images/сушивок.jpeg",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 2,
    chefs: 5,
    recipes: 26,
    title: "Burger King",
    description: "Скидка на обед",
    imageSrc: "images/burgerking.png",
    color: Colors.deepOrangeAccent,
  ),
  RecipeBundle(
    id: 3,
    chefs: 50,
    recipes: 43,
    title: "Alex Fitness",
    description: "Скидка на первое посещение",
    imageSrc: "images/alex.svg",
    color: Color(0xff666666),
  ),
];

List<RecipeBundle> gold = [
  RecipeBundle(
    id: 1,
    chefs: 10,
    recipes: 95,
    title: "Суши вок",
    description: "Скидка на доставку роллов",
    imageSrc: "images/сушивок.jpeg",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 2,
    chefs: 5,
    recipes: 26,
    title: "Burger King",
    description: "Скидка на обед",
    imageSrc: "images/burgerking.png",
    color: Colors.deepOrangeAccent,
  ),
  RecipeBundle(
    id: 3,
    chefs: 50,
    recipes: 43,
    title: "Alex Fitness",
    description: "Скидка на первое посещение",
    imageSrc: "images/alex.svg",
    color: Color(0xff666666),
  ),
];