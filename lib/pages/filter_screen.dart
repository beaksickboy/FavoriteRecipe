import 'package:favorite_menu/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;
  final currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree, _vegetarian, _vegan, _lactoseFree;

  @override
  initState() {
    this._glutenFree = widget.currentFilters['gluten'];
    this._vegetarian = widget.currentFilters['vegeterian'];
    this._vegan = widget.currentFilters['vegan'];
    this._lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': this._glutenFree,
                  'lactose': this._lactoseFree,
                  'vegan': this._vegan,
                  'vegeterian': this._vegetarian
                } as Map<String, bool>;
                widget.saveFilters(selectedFilter);
              },
            )
          ],
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
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
