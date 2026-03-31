enum MealType {
  breakfast,
  lunch,
  dinner,
  snack,
  other
}

class Meal {
  MealType mealType;
  String title;
  DateTime scheduled;
  List<String> items;
  int? calories;
  int? carbs;
  int? protein;

  Meal({required this.mealType, required this.title, required this.scheduled, required this.items, this.calories, this.carbs, this.protein});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      mealType: json["mealType"],
      title: json["title"],
      scheduled: json["scheduled"],
      items: json["items"],
      calories: json["calories"],
      carbs: json["carbs"],
      protein: json["protein"]
    );
  }

  Map<String, dynamic> toJson() => {
    'mealType': mealType,
    'title': title,
    'scheduled': scheduled,
    'items': items,
    if(calories != null) 'calories': calories,
    if(carbs != null) 'carbs': carbs,
    if(protein != null) 'protein': protein,
  };
}