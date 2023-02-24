import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryName!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Text('hi'),
          itemCount: 10,
        ),
      ),
    );
  }
}
