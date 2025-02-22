import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key , required this.onToggleFavorite , required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;

  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category){
    var filteredCat = 
            availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Meals(
        title: category.title,
        meals: filteredCat , 
        onToggleFavorite:onToggleFavorite ,
        ),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
          ),
          children: [
            for (final category in availableCategories)
            CategoryGridItem(category: category , onSelectCategory: (){
              _selectCategory(context , category);
            },)
          ],);
  }
}