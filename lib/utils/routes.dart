import 'package:flutter/material.dart';
import 'package:mealplanner/views/loader.dart';
import 'package:mealplanner/views/meal_list.dart';

class Routes {
  static const loader = '/loader';
  static const mealList = '/mealList';
}

final Map<String, WidgetBuilder> routes = {
  Routes.loader: (context) => Loader(),
  Routes.mealList: (context) => MealList(),
};