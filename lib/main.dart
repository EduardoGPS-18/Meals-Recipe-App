import 'package:Meals/data/dummy_data.dart';
import 'package:Meals/models/settings.dart';
import 'package:Meals/screens/categories_meals_screen.dart';
import 'package:Meals/screens/meal_detail_screen.dart';
import 'package:Meals/screens/settings_screen.dart';
import 'package:Meals/screens/tabs_screen.dart';
import 'package:Meals/utils/app-routes.dart';
import 'package:flutter/material.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Settings settings = Settings();
  
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }
 
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((element) {
        final filterGluten = settings.isGlutenFree && !element.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !element.isLactoseFree;
        final filterVegan = settings.isVegan && !element.isVegan;
        final filterVegetarian = settings.isVegetarian && !element.isVegetarian;

        return !filterGluten && !filterLactose &&!filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      initialRoute: "/", // => Default
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAILS: (_) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (_) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}