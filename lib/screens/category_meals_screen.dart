import 'package:flutter/material.dart';

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
          title: Text(categoryName!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Text(categoryMeals[index].title),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
