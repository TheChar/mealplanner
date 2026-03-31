import 'package:flutter/material.dart';
import 'package:mealplanner/state/meal_list_provider.dart';
import 'package:mealplanner/utils/routes.dart';
import 'package:mealplanner/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MealPlanner());
}

class MealPlanner extends StatelessWidget {
  const MealPlanner({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => MealListProvider()..loadMeals(),
      child: MaterialApp(
        title: 'Meal Planner',
        theme: MPTheme.theme,
        initialRoute: Routes.loader,
        routes: routes,
      ),
    );
  }
}
