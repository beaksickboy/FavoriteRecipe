import 'package:favorite_menu/categories-screen.dart';
import 'package:favorite_menu/pages/favorite_screen.dart';
import 'package:favorite_menu/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Titlke'),
  //         bottom: TabBar(
  //           tabs: <Widget>[
  //             Tab(
  //               icon: Icon(Icons.category),
  //               text: 'Category',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.star),
  //               text: 'Favorite',
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: <Widget>[
  //           CategoriesScreen(),
  //           FavoriteScreen()
  //         ],
  //       ),
  //     ),
  //   );
  // }

  int _currentIndex = 0;
  final List<Widget> pages = [CategoriesScreen(), FavoriteScreen()];

  _selectTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: _selectTab,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Category'),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorite'),
              backgroundColor: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}
