import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  buildSection(String title, IconData icon, tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(fontSize: 23),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 120,
          width: double.infinity,
          child: Text(
            'Cooking Recipe',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        buildSection(
          'Meals',
          Icons.restaurant,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildSection(
          'Filters',
          Icons.settings,
          () {
            Navigator.of(context).pushReplacementNamed('/filter');
          },
        ),
      ],
    );
  }
}
