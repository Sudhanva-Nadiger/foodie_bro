import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Foodie Bro',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BuildListTile(
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          BuildListTile(
            icon: Icons.settings,
            title: 'Filters',
            onTap: () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const BuildListTile({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () => onTap(),
    );
  }
}
