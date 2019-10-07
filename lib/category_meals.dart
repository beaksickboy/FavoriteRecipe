import 'package:favorite_menu/mock-data/dummy-data.dart';
import 'package:favorite_menu/models/meal.dart';
import 'package:favorite_menu/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String catgoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!this._loadedInitData) {
      final params =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final id = params['id'];
      this.catgoryTitle = params['title'];
      print(this.catgoryTitle);

      this.displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(id);
      }).toList();
    }
    this._loadedInitData = true;
    super.didChangeDependencies();
  }

  _removeMeal(mealId) {
    setState(() {
      this.displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.catgoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = displayedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: this.displayedMeals.length,
      ),
    );
  }
}
