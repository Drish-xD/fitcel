class Diet {
  final int id;
  final String dietType;
  final String description;
  final List<Meal> meals;

  const Diet({
    required this.id,
    required this.dietType,
    required this.description,
    required this.meals,
  });

  factory Diet.fromJson(Map<String, dynamic> json) {
    List<Meal> meals = [];
    json['meals'].forEach((v) {
      meals.add(Meal.fromJson(v));
    });
    return Diet(
        id: json['id'],
        dietType: json['dietType'],
        description: json['description'],
        meals: meals);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dietType'] = dietType;
    data['description'] = description;
    data['meals'] = meals.map((v) => v.toJson()).toList();
    return data;
  }
}

class Meal {
  final String name;
  final List<Food> foods;

  const Meal({required this.name, required this.foods});

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<Food> foods = [];
    json['foods'].forEach((v) => foods.add(Food.fromJson(v)));
    return Meal(name: json['name'], foods: foods);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['foods'] = foods.map((v) => v.toJson()).toList();
    return data;
  }
}

class Food {
  final String name;
  final double calories;

  const Food({required this.name, required this.calories});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(name: json['name'], calories: json['calories'].toDouble());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['calories'] = calories;
    return data;
  }
}
