import 'package:flutter/material.dart';
import 'package:meal/models/bookmark.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/providers/db_helper.dart';
import 'package:meal/widgets/common.dart';
import 'package:provider/provider.dart';

class BookmarkButton extends StatelessWidget {
  final int id;
  final Food? data;

  const BookmarkButton({
    Key? key,
    required this.id,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);
    return FutureBuilder<bool>(
      future: provider.test(id),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: customCircularIndicator());
        }
        if (snapshot.data == true) {
          return IconButton(
            onPressed: () {
              provider.deleteBookmark(id);
            },
            icon: const Icon(Icons.bookmark),
          );
        }
        return IconButton(
          onPressed: () {
            provider.insertBookmark([
              Bookmark(
                id: id,
                url: data?.strMealThumb ?? '',
                name: data?.strMeal ?? '',
              )
            ]);
          },
          icon: const Icon(Icons.bookmark_border),
        );
      },
    );
  }
}
