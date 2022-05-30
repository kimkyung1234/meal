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
    throw Exception("Error loading");
  }
}

Future<Meal> getMealDataByCategory({required String inputText}) async {
  final response = await get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=$inputText'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading");
  }
}

Future<Meal> getMealDataById({required String id}) async {
  final response = await get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading");
  }
}

Future<Meal> getMealDataByInputText({required String inputText}) async {
  final response = await get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=$inputText'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading");
  }
}

Future<Meal> getAreaList() async {
  final response = await get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading");
  }
}

Future<Meal> getMealDataByArea({required String area}) async {
  final response = await get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?a=$area'));
  if (response.statusCode == 200) {
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading");
  }
}
