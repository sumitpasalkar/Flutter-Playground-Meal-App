import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provides/favorite_provider.dart';
class MealDetails extends ConsumerWidget {
  const MealDetails({super.key , required this.meals});

  final Meal meals;
@override
  Widget build(BuildContext context , WidgetRef ref) {
    final fevMeals = ref.watch(favMealProvider);

    final isFav = fevMeals.contains(meals);
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(onPressed: (){
           final wasAdded = ref
            .read(favMealProvider.notifier)
            .toggleMealFavStatus(meals);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(wasAdded ? 'Meal added to favourite' : 'MEal removed from favourite'))
            );
          }, icon: Icon(isFav ? Icons.star : Icons.star_border))
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