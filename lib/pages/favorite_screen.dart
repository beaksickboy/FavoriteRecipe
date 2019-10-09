import 'package:favorite_menu/models/meal.dart';
import 'package:favorite_menu/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (this._favoriteMeals.isEmpty) {
      return Text('No favorite yet');
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final meal = this._favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
          );
        },
        itemCount: this._favoriteMeals.length,
      );
    }
  }
}
