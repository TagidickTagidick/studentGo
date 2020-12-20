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

List<RecipeBundle> bronze = [
  RecipeBundle(
    id: 1,
    chefs: 80,
    recipes: 95,
    title: "Литрес",
    description: "Первая электронная книга",
    imageSrc: "images/литрес.svg",
    color: Colors.brown[300],
  ),
  RecipeBundle(
    id: 2,
    chefs: 10,
    recipes: 26,
    title: "Burger King",
    description: "Скидка на обед",
    imageSrc: "images/burgerking.png",
    color: Colors.deepOrangeAccent,
  ),
  RecipeBundle(
    id: 3,
    chefs: 30,
    recipes: 43,
    title: "Читай город",
    description: "При покупке от 5000р.",
    imageSrc: "images/читай_город.svg",
    color: Colors.blue,
  ),
];

List<RecipeBundle> serebro = [
  RecipeBundle(
    id: 1,
    chefs: 5,
    recipes: 95,
    title: "Мвидео",
    description: "Скидка на покупку",
    imageSrc: "images/мвидео.svg",
    color: Colors.red,
  ),
  RecipeBundle(
    id: 2,
    chefs: 5,
    recipes: 26,
    title: "Sokolov",
    description: "Скидка на покупку",
    imageSrc: "images/sokolov.svg",
    color: Colors.deepOrangeAccent,
  ),
  RecipeBundle(
    id: 3,
    chefs: 100,
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
    chefs: null,
    recipes: 95,
    title: "ВТБ брокер",
    description: "Бесплатный чек-лист",
    imageSrc: "images/втб.svg",
    color: Color(0xff0a2896),
  ),
  RecipeBundle(
    id: 1,
    chefs: 7,
    recipes: 95,
    title: "Мвидео",
    description: "Скидка на покупку",
    imageSrc: "images/мвидео.svg",
    color: Colors.red,
  ),
  RecipeBundle(
    id: 2,
    chefs: 7,
    recipes: 26,
    title: "Sokolov",
    description: "Скидка на покупку",
    imageSrc: "images/sokolov.svg",
    color: Colors.deepOrangeAccent,
  ),
];

List<RecipeBundle> plate = [
  RecipeBundle(
    id: 1,
    chefs: null,
    recipes: 95,
    title: "ВТБ инвестиции",
    description: "Бесплатный онлайн-курс",
    imageSrc: "images/втб.svg",
    color: Color(0xff0a2896),
  ),
  RecipeBundle(
    id: 1,
    chefs: 10,
    recipes: 95,
    title: "Мвидео",
    description: "Скидка на покупку",
    imageSrc: "images/мвидео.svg",
    color: Colors.red,
  ),
  RecipeBundle(
    id: 2,
    chefs: 10,
    recipes: 26,
    title: "Sokolov",
    description: "Скидка на покупку",
    imageSrc: "images/sokolov.svg",
    color: Colors.deepOrangeAccent,
  ),
];