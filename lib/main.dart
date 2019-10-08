import 'package:favorite_menu/categories-screen.dart';
import 'package:favorite_menu/category_meals.dart';
import 'package:favorite_menu/mock-data/dummy-data.dart';
import 'package:favorite_menu/models/meal.dart';
import 'package:favorite_menu/pages/filter_screen.dart';
import 'package:favorite_menu/pages/tabs_screen.dart';
import 'package:favorite_menu/widgets/meal_detail.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };
  List<Meal> _availableMeal = DUMMY_MEALS;

  void setFilter(Map<String, bool> filterData) {
    setState(() {
      this._filters = filterData;
      this._availableMeal.where((meal) {
        if (this._filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (this._filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (this._filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (this._filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(fontSize: 20),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        MealDetail.routeName: (ctx) => MealDetail(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(this._availableMeal),
        FilterScreen.routeName: (ctx) => FilterScreen(this._filters, this.setFilter)
      },
      // onGenerateRoute: ,
    );
  }
}
