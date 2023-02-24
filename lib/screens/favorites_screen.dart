import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen(this.fvrtMeals, {Key? key}) : super(key: key);

  final List<Meal> fvrtMeals;

  @override
  State<FavoritesScreen> createState() => _FavoritesState();
}

class _FavoritesState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    bool empty = widget.fvrtMeals.isEmpty;
    return Scaffold(
      body: !empty
          ? ListView.builder(
              itemBuilder: (context, index) {
                final item = widget.fvrtMeals[index];
                return MealItem(
                    id: item.id,
                    title: item.title,
                    imageUrl: item.imageUrl,
                    affordability: item.affordability,
                    complexity: item.complexity,
                    durarion: item.duration);
              },
              itemCount: widget.fvrtMeals.length,
            )
          : const Center(
              child:
                  Text('You dont have any favorites yet - try adding some !'),
            ),
    );
  }
}
