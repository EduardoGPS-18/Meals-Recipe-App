import 'package:Meals/components/meal_item.dart';
import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> _favoriteMeals;

  const FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(_favoriteMeals.isEmpty) {
      return Center(
        child: Text("Nenhuma comida marcada como favorita"),
      );
    } else {
      return ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(_favoriteMeals[index]);
        }
      );
    }
  }
}