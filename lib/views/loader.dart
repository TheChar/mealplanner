import 'package:flutter/material.dart';
import 'package:mealplanner/state/meal_list_provider.dart';
import 'package:mealplanner/utils/routes.dart';
import 'package:provider/provider.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    final prvd = context.read<MealListProvider>();
    prvd.addListener(() {
      if(context.read<MealListProvider>().loaded) {
        Navigator.pushReplacementNamed(
          context,
          Routes.mealList
        );
      }
    });
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/icon.png')
        ]
      )
    );
  }
}