// import 'package:favorite_menu/category_meals.dart';
import 'package:favorite_menu/category_meals.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  navigateToMeals(context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) {
    //     return CategoryMeals(this.title, this.color);
    //   },
    // ));

    Navigator.of(context).pushNamed(
      CategoryMeals.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToMeals(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.title,
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
