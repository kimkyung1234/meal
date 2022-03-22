import 'dart:convert';

import 'package:http/http.dart';
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
