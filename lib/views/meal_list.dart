import 'package:flutter/material.dart';
import 'package:mealplanner/models/meal.dart';
import 'package:mealplanner/state/meal_list_provider.dart';
import 'package:mealplanner/widgets/popup_meal_editor.dart';
import 'package:provider/provider.dart';

class MealList extends StatefulWidget {
  const MealList({super.key});

  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Meal Planner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => PopupMealEditor(
              meal: Meal(
                mealType: MealType.breakfast, 
                title: "My Meal",
                scheduled: context.read<MealListProvider>().rangeStartDate,
                items: []
              )
            )
          );
        },
        tooltip: 'Create new Meal',
        child: const Icon(Icons.add),
      ),
    );
  }
}