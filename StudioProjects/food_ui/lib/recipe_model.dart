import 'package:flutter/foundation.dart';
import 'package:food_ui/category_model.dart';

class Recipe {
  late String img;
  late String recipeName;
  late String shortDescription;
  late String longDescription;
  late String difficultyLevel;
  late String duration;
  late List<CategoryModel> ingredients;

  Recipe(
      {required this.img,
      required this.recipeName,
      required this.shortDescription,
      required this.longDescription,
      required this.difficultyLevel,
      required this.duration,
      required this.ingredients});

  Recipe.fromJson(Map<String, dynamic> json) {
    img = json["img"];
    recipeName = json["recipeName"];
    shortDescription = json["shortDescription"];
    longDescription = json["longDescription"];
    difficultyLevel = json["difficultyLevel"];
    duration = json["duration"];
  }
}
