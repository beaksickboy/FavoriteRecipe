import 'package:favorite_menu/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  buildSwitchListTile(
      String title, String description, bool currentValue, Function func) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: (value) {
        setState(() {
          func(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal option',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                    'Gluten Free',
                    'Only include Gluten',
                    this._glutenFree,
                    (value) {
                      this._glutenFree = value;
                    },
                  ),
                  buildSwitchListTile(
                    'Lactose Free',
                    'Only include Lactose Free',
                    this._lactoseFree,
                    (value) {
                      this._lactoseFree = value;
                    },
                  ),
                  buildSwitchListTile(
                    'Vegeterian Free',
                    'Only include Vegeterian',
                    this._vegetarian,
                    (value) {
                      this._vegetarian = value;
                    },
                  ),
                  buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan',
                    this._vegan,
                    (value) {
                      this._vegan = value;
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
