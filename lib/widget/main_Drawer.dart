import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key , required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;  
  @override
  Widget build(BuildContext context) {
   return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight
              )
          ),
          child: Row(
            children: [
              Icon(Icons.fastfood_outlined , size: 48,color: Theme.of(context).colorScheme.primary,),
              const SizedBox(width: 18,),
              Text('Cooking Up',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ),)
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text('Meals' ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ) ),
              onTap: (){
                onSelectScreen('meals');
              },
        ),
         ListTile(
          leading: Icon(Icons.settings),
          title: Text('Filters' ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ) ),
              onTap: (){
                onSelectScreen('settings');
              },
        )
      ],
    ),
   );
  }

}