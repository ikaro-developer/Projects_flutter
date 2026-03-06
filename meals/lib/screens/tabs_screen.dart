import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/favorite_screen.dart';
import 'package:meals/screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMails;
  const TabsScreen(this._favoriteMails, {super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreen = 0;

  List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': "Lista de categorias", 'screen': CategoriesScreen()},
      {
        'title': "Meus Favoritos",
        'screen': FavoriteScreen(widget._favoriteMails),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _screens[_selectedScreen]['title'] as String,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreen]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColorDark,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        currentIndex: _selectedScreen,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
        ],
      ),
    );
  }
}
