import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mealplanner/models/meal.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class MealListProvider extends ChangeNotifier {
  List<Meal> _meals = [];
  List<Meal> _dispMeals = [];
  List<Meal> get meals => _dispMeals;
  bool loaded = false;
  DateTime rangeStartDate = DateUtils.dateOnly(DateTime.now());
  DateTime rangeEndDate = DateUtils.dateOnly(DateTime.now().add(Duration(days:7)));

  Future<File> mealsFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/meals.json');
  }

  Future<File> goalsFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/goals.json');
  }

  void loadMeals() async {
    File fMeals = await mealsFile();
    if(!await fMeals.exists()) {
      fMeals.writeAsString(jsonEncode([]));
    }
    final String mealData = await fMeals.readAsString();
    final List<dynamic> data = await json.decode(mealData);
    _meals = data.map((meal) => Meal.fromJson(meal)).toList();
    _meals.sort((a, b) => a.scheduled.compareTo(b.scheduled));
    _dispMeals = List.from(_meals);
    _dispMeals.removeWhere((meal) => meal.scheduled.isBefore(rangeStartDate) || meal.scheduled.isAfter(rangeEndDate));
    loaded = true;
    await Future.delayed(Duration(seconds:1));
    notifyListeners();
  }

  void saveMeals() async {
    List<Map<String, dynamic>> jsonifiedMeals = _meals.map((meal) => meal.toJson()).toList();
    final String data = json.encode(jsonifiedMeals);
    await (await mealsFile()).writeAsString(data);
  }

  void setRange(DateTime startDate) {
    rangeStartDate = DateUtils.dateOnly(startDate);
    rangeEndDate = rangeStartDate.add(Duration(days: 7));
    _dispMeals.removeWhere((meal) => meal.scheduled.isBefore(rangeStartDate) || meal.scheduled.isAfter(rangeEndDate));
    notifyListeners();
  }

  void createMeal(String title, MealType mealType, DateTime scheduled, int? calories, int? carbs, int? protein) {
    //Create meal object
    Meal m = Meal(title: title, mealType: mealType, scheduled: scheduled, items: [], calories: calories, carbs: carbs, protein: protein);
    //Add to _meals and _dispMeals
    _meals.add(m);
    _meals.sort((a, b) => a.scheduled.compareTo(b.scheduled));
    _dispMeals = List.from(_meals);
    _dispMeals.removeWhere((meal) => meal.scheduled.isBefore(rangeStartDate) || meal.scheduled.isAfter(rangeEndDate));
    //Add meal to JSON set
    saveMeals();
  }
}