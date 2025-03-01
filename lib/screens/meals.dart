import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/meal_details.dart';
import 'package:meal_app/widget/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.meals, this.title});

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(meals: meal ), // ✅ Fix typo: 'meals' to 'meal'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
      ),
      body: meals.isEmpty
          ? Center(child: Text('No Data'))
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: meals[index], 
                onSelectMeal: (context, meal) { 
                  selectMeal(context, meal);
                },
              ),
            ),
    );
  }
}
