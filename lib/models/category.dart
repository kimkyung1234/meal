class Category {
  Category({
    this.categories,
  });
  List<Kind>? categories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categories:
            List<Kind>.from(json['categories'].map((x) => Kind.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'categories': List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Kind {
  Kind({this.strCategory, this.strCategoryThumb, this.strCategoryDescription});
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  factory Kind.fromJson(Map<String, dynamic> json) => Kind(
        strCategory: json['strCategory'],
        strCategoryThumb: json['strCategoryThumb'],
        strCategoryDescription: json['strCategoryDescription'],
      );

  Map<String, dynamic> toJson() => {
        'strCategory': strCategory,
        'strCategoryThumb': strCategoryThumb,
        'strCategoryDescription': strCategoryDescription,
      };
}
