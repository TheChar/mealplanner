import 'package:flutter/material.dart';
import 'package:mealplanner/models/meal.dart';
import 'package:mealplanner/state/meal_list_provider.dart';
import 'package:provider/provider.dart';

class PopupMealEditor extends StatelessWidget {
  final Meal meal;
  const PopupMealEditor({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: meal.title);
    TextEditingController caloriesController = TextEditingController(text: (meal.calories ?? 0).toString());
    TextEditingController carbsController = TextEditingController(text: (meal.carbs ?? 0).toString());
    TextEditingController proteinController = TextEditingController(text: (meal.protein ?? 0).toString());

    return Dialog(
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Text('Create a Meal'),
              TextFormField(
                controller: titleController, 
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: "Meal Name",
                )
              ),
              DatePickerDialog(
                firstDate: DateTime(1970),
                lastDate: DateTime.now().add(Duration(days: 90)),
                currentDate: context.read<MealListProvider>().rangeStartDate,
              ),
              TextFormField(
                controller: caloriesController,
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: "Calories",
                )
              ),
              TextFormField(
                controller: carbsController,
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: "Carbs",
                ),
              ),
              TextFormField(
                controller: proteinController,
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: "Protein",
                ),
              ),
              TextButton(
                onPressed: () {

                },
                child: Text("Create"),
              )
            ]
          )
        )
      )
    );
  }
}