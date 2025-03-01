import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavMealNotifier extends  StateNotifier<List<Meal>>{
  FavMealNotifier() : super([]);

  bool toggleMealFavStatus(Meal meal){
    final mealIsFav = state.contains(meal);

    if(mealIsFav){
      state = state.where((m)=> m.id != meal.id).toList();
      return false;
    }else{
      state = [...state , meal];
      return true;
    }
  }
}

final favMealProvider = StateNotifierProvider <FavMealNotifier , List<Meal>>( (ref) {
  return FavMealNotifier();
});