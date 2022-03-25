import 'package:flutter/material.dart';
import 'package:meal/models/bookmark.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/services/api.dart';
import 'package:meal/services/db_helper.dart';
import 'package:meal/widgets/common.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: Colors.black),
        ),
      ),
      body: FutureBuilder<Meal>(
        future: getMealDataById(id: id),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: customCircularIndicator());
          }
          final data = snapshot.data?.lists?[0];
          var id = int.parse(data?.idMeal ?? '');
          assert(id is int);
          var check = provider.test(id);
          print(check);

          return ListView(
            children: [
              carryImageWidget(
                url: data?.strMealThumb ?? '',
                boxFit: BoxFit.fill,
                radius: 0,
              ),
              flexibleText(
                text: data?.strMeal ?? '',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      flexibleText(
                        text: 'Category : ${data?.strCategory}',
                        fontSize: 13,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        alignment: Alignment.topLeft,
                      ),
                      flexibleText(
                        text: 'Area : ${data?.strArea}',
                        fontSize: 13,
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     provider.insertBookmark([
                  //       Bookmark(
                  //         id: id,
                  //         url: data?.strMealThumb ?? '',
                  //         name: data?.strMeal ?? '',
                  //       )
                  //     ]);
                  //   },
                  //   icon: const Icon(Icons.bookmark_border),
                  // ),

                  // ignore: unrelated_type_equality_checks

                  FutureBuilder<bool>(
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
                  ),
                ],
              ),
              customDivider(),
              flexibleText(
                text: data?.strInstructions ?? 'No data',
                textColor: Colors.black87,
                padding: const EdgeInsets.all(5),
              ),
            ],
          );
        },
      ),
    );
  }
}
