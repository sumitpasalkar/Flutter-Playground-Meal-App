import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provides/filters_provider.dart';

class Filters extends ConsumerWidget{

  const Filters({super.key});


  @override
  Widget build(BuildContext context  , WidgetRef ref) {
    final activeFilter = ref.watch(flterprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: 
       Column(
          children: [
            SwitchListTile(
              value: activeFilter[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(flterprovider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: const Text('Gluten-free'),
              subtitle: const Text('Only include gluten-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilter[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(flterprovider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: const Text('lactoseFree'),
              subtitle: const Text('Only include lactoseFree meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
                 SwitchListTile(
              value: activeFilter[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(flterprovider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: const Text('vegan'),
              subtitle: const Text('Only include vegan meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
                 SwitchListTile(
              value: activeFilter[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(flterprovider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: const Text('vegetarian'),
              subtitle: const Text('Only include vegetarian meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
  }
}
