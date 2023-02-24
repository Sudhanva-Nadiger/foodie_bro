import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../constants/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  static const routeName = '/category-meals';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryName = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryName!,
            style: const TextStyle(fontFamily: 'Raleway'),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final item = categoryMeals[index];
            return MealItem(
                id: item.id,
                title: item.title,
                imageUrl: item.imageUrl,
                affordability: item.affordability,
                complexity: item.complexity,
                durarion: item.duration);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
