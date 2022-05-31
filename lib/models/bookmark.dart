class Bookmark {
  final int id;
  final String url;
  final String name;

  Bookmark({
    required this.id,
    required this.url,
    required this.name,
  });

  Bookmark.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        url = res['url'],
        name = res['name'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'name': name,
    };
  }
}
