import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provides/meals_provider.dart';
import 'package:meal_app/provides/favorite_provider.dart';
import 'package:meal_app/provides/filters_provider.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widget/main_Drawer.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _TabStateScreen();
  }
}

class _TabStateScreen extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal = [];
  Map<Filter, bool> _filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  void _setScreen(String identifier) async {
    if (identifier == 'settings') {
      Navigator.pop(context);
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => Filters()),
      );
    }

 
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
   final activeFilters =  ref.watch(flterprovider);
   final availableMeals = ref.watch(filterMeals);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favmeals = ref.watch(favMealProvider);

      activePage = Meals(
        meals: favmeals,
      );
      activePageTitle = 'Favorite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
