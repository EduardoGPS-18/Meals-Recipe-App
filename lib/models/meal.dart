import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;

  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  final Complexity complexity;
  final Cost cost;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.imageUrl,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.complexity,
    @required this.cost,
  });

  String get complexityText {
    switch(complexity) {
      case(Complexity.Simple):
        return 'Simples';
      case(Complexity.Medium):
        return 'Normal';
      case(Complexity.Difficult):
        return "Dificil";
      default:
        return "Desconhecida";
    }
  }

  String get costText {
    switch(cost) {
      case(Cost.Cheap):
        return 'Barato';
      case(Cost.Fair):
        return 'Justo';
      case(Cost.Expensive):
        return "Caro";
      default:
        return "Desconhecida";
    }
  }
}
