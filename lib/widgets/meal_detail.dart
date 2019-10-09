import 'package:favorite_menu/mock-data/dummy-data.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function _toggleFavorite;
  final Function _isMealFavorite;

  MealDetail(this._toggleFavorite, this._isMealFavorite);

  buildTitle(context, text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  buildContainer({child}) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      margin: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          this._isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          // Navigator.of(context).pop(mealId);
          this._toggleFavorite(mealId);
        },
      ),
    );
  }
}
