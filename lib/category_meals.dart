import 'package:favorite_menu/mock-data/dummy-data.dart';
import 'package:favorite_menu/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryMeals extends StatelessWidget {
  // final String title;
  // final Color color;

  static const routeName = '/category-meals';

  // CategoryMeals(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final params =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    print(params);
    final id = params['id'];
    final title = params['title'];
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealItem(
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
