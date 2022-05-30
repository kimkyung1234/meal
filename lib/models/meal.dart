class Meal {
  Meal({
    this.lists,
  });
  List<Food>? lists;

  factory Meal.fromJson(Map<String, dynamic> json) =>
      Meal(lists: List<Food>.from(json['meals'].map((x) => Food.fromJson(x))));

  Map<String, dynamic> toJson() => {
        'meals': List<dynamic>.from(lists!.map((x) => x.toJson())),
      };
}

class Food {
  Food({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strInstructions,
    this.strMealThumb,
    this.strArea,
    this.strTag,
    this.strYouTube,
  });
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strInstructions;
  String? strMealThumb;
  String? strArea;
  String? strTag;
  String? strYouTube;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strCategory: json['strCategory'],
        strInstructions: json['strInstructions'],
        strMealThumb: json['strMealThumb'],
        strArea: json['strArea'],
        strTag: json['strTags'],
        strYouTube: json['strYoutube'],
      );

  Map<String, dynamic> toJson() => {
        'idMeal': idMeal,
        'strMeal': strMeal,
        'strCategory': strCategory,
        'strInstructions': strInstructions,
        'strMealThumb': strMealThumb,
        'strArea': strArea,
      };
}
