import 'package:flutter/material.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filtersState) {
    setState(
      () {
        _filters = filtersState;
        _availableMeals = DUMMY_MEALS.where(
          (meal) {
            if (_filters['gluten']! && !meal.isGlutenFree) {
              return false;
            }
            if (_filters['lactose']! && !meal.isLactoseFree) {
              return false;
            }
            if (_filters['vegan']! && !meal.isVegan) {
              return false;
            }
            if (_filters['vegetarian']! && !meal.isVegetarian) {
              return false;
            }
            return true;
          },
        ).toList();
      },
    );
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _fvrtMeals = [];

  void _toggleFvrt(String mealId) {
    final existingIndex = _fvrtMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _fvrtMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _fvrtMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFvrtMeal(String id) {
    return _fvrtMeals.any((meal) => meal.id == id);
  }

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
                  fontWeight: FontWeight.bold),
              headline2: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_fvrtMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(_toggleFvrt, _isFvrtMeal),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
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
