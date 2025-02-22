import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key , required this.meals , required this.onToggleFavorite});

  final Meal meals;
  final void Function(Meal meal) onToggleFavorite;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavorite(meals);
          }, icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
          meals.imageUrl,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 14,),
         Text('Ingredients' , style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary
         ),),
        const SizedBox(height: 14,),
         for(final ingredient in meals.ingredients)
         Text(ingredient , style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
         )),
        const SizedBox(height: 14,),
             Text('Steps' , style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary
         ),),
        const SizedBox(height: 14,),
        for(final ingredient in meals.steps)
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
          child :  Text(ingredient , style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
         )),
          )
             
        ],),
      ),
    
      
    );
  }
}