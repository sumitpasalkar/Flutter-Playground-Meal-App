import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  const MealItem({super.key , required this.meal , required this.onSelectMeal});

  final Meal meal;

  String get affordableText {
    return meal.affordability.name;
  }

  final void Function(BuildContext context,Meal meal) onSelectMeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child:  InkWell(
        onTap: (){
          onSelectMeal(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
               image: NetworkImage(meal.imageUrl),
               fit: BoxFit.cover,
               width: double.infinity,
               height: 200,
               ),
               Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                  color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        meal.title , maxLines: 2, 
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          MealItemTrait(iconData: Icons.schedule , label: '${meal.duration} min'),
                          const SizedBox(width: 12,),
                          MealItemTrait(iconData: Icons.work , label: '${meal.complexity.name} '),
                          const SizedBox(width: 12,),
                          MealItemTrait(iconData: Icons.attach_money , label: '${meal.affordability.name} ' )
                        ],
                      )
                    ],
                  ),
                ),
                ),
          ],
        ),
      ),
    );
  }
}