import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class Filters extends StatefulWidget {
  final Map<Filter, bool> currentFilters;

  const Filters({super.key, required this.currentFilters});

  @override
  State<Filters> createState() {
    return _FilterState();
  }
}

class _FilterState extends State<Filters> {
  late bool _glutenFreeFilter;
  late bool _lactoseFreeFilter;
  late bool _vegFreeFilter;
  late bool _veganFreeFilter;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree] ?? false;
    _vegFreeFilter = widget.currentFilters[Filter.vegetarian] ?? false;
    _veganFreeFilter = widget.currentFilters[Filter.vegan] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegFreeFilter,
            Filter.vegan: _veganFreeFilter,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
              },
              title: const Text('Gluten-free'),
              subtitle: const Text('Only include gluten-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: const Text('Lactose-free'),
              subtitle: const Text('Only include lactose-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilter = isChecked;
                });
              },
              title: const Text('Vegan-free'),
              subtitle: const Text('Only include vegan-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegFreeFilter = isChecked;
                });
              },
              title: const Text('Vegetarian-free'),
              subtitle: const Text('Only include vegetarian-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
