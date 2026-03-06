import 'package:flutter/material.dart';
import 'package:meals/components/banner_component.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';

import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMails = DUMMY_MEALS;

  List<Meal> _favoriteMails = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMails = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMails.contains(meal)
          ? _favoriteMails.remove(meal)
          : _favoriteMails.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMails.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vamos Cozinhas",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.from(alpha: 255, red: 254, green: 229, blue: 1),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => BannerComponent(TabsScreen(_favoriteMails)),
        AppRoutes.CATEGORY_MEALS: (ctx) =>
            BannerComponent(CategoriesMealsScreen(_availableMails)),
        AppRoutes.MEAL_DETAIL: (ctx) =>
            BannerComponent(MealDetailScreen(_toggleFavorite, isFavorite)),
        AppRoutes.SETTINGS: (ctx) =>
            BannerComponent(SettingsScreen(_filterMeals, settings)),
      },
    );
  }
}
