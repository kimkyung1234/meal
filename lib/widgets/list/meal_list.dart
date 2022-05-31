import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/pages/pages.dart';
import 'package:meal/widgets/widgets.dart';

class MealList extends StatelessWidget {
  final AsyncSnapshot<Meal> snapshot;
  final bool categorVisible;

  const MealList({
    Key? key,
    required this.snapshot,
    this.categorVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      padding: const EdgeInsets.all(18),
      itemCount: snapshot.data?.lists?.length ?? 0,
      itemBuilder: (_, index) {
        final data = snapshot.data?.lists?[index];
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  id: data?.idMeal ?? '',
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 130,
            child: Row(
              children: <Widget>[
                SquareImage(url: data?.strMealThumb ?? ''),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      flexibleText(
                        text: data?.strMeal ?? '',
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        alignment: Alignment.topLeft,
                        overflow: TextOverflow.ellipsis,
                      ),
                      categorVisible
                          ? flexibleText(
                              text: data?.strCategory ?? '',
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              alignment: Alignment.topLeft,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
