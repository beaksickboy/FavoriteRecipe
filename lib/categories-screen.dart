import 'package:favorite_menu/category_item.dart';
import 'package:favorite_menu/mock-data/dummy-data.dart';
import 'package:favorite_menu/models/category.dart';

import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scroll is main axis
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map(this.createCategory).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, // cross / main
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
      ),
    );
  }

  CategoryItem createCategory(Category category) {
    return CategoryItem(category.id, category.title, category.color);
  }
}
