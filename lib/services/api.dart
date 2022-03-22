import 'dart:convert';

import 'package:http/http.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';

Future<Meal> getRandomMealData() async {
  final response = await get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}

Future<Category> getCategoryData() async {
  final response = await get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
  if (response.statusCode == 200) {
    return Category.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}

Future<Meal> getMealDataByCategory({required String inputText}) async {
  final response = await get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=$inputText'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}

Future<Meal> getMealDataById({required String id}) async {
  final response = await get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}
