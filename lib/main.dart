import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie bro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
              ),
              headline2: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: const CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
      },
    );
  }
}
