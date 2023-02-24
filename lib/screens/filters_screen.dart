import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-page';
  const FilterScreen(this.filters, this.saveFilters, {Key? key})
      : super(key: key);

  final Function saveFilters;
  final Map<String, bool> filters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarion = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] ?? false;
    _lactoseFree = widget.filters['lactose'] ?? false;
    _vegan = widget.filters['vegan'] ?? false;
    _vegetarion = widget.filters['vegetarion'] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Filters',
            style: TextStyle(fontFamily: 'Raleway'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarion,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchTile(
                    'Gluten-free',
                    'Include only gluten free meal',
                    _glutenFree,
                    (val) {
                      setState(
                        () {
                          _glutenFree = val;
                        },
                      );
                    },
                  ),
                  _buildSwitchTile(
                    'Lactose-free',
                    'Include only Lactose free meal',
                    _lactoseFree,
                    (val) {
                      setState(
                        () {
                          _lactoseFree = val;
                        },
                      );
                    },
                  ),
                  _buildSwitchTile(
                    'Vegetarian',
                    'Include only Vegetarian meal',
                    _vegetarion,
                    (val) {
                      setState(
                        () {
                          _vegetarion = val;
                        },
                      );
                    },
                  ),
                  _buildSwitchTile(
                    'Vegan',
                    'Include only vegan meal',
                    _vegan,
                    (val) {
                      setState(
                        () {
                          _vegan = val;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
      String title, String info, bool initVal, Function updateVal) {
    return SwitchListTile(
      value: initVal,
      onChanged: (val) => updateVal(val),
      title: Text(title),
      subtitle: Text(info),
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
