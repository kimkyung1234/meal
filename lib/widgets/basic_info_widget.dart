import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/bookmark_button.dart';
import 'package:meal/widgets/common.dart';

class BasicInfoWidget extends StatelessWidget {
  final int mealId;
  final Food mealData;

  const BasicInfoWidget({
    Key? key,
    required this.mealId,
    required this.mealData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            flexibleText(
              text: 'Category : ${mealData.strCategory}',
              fontSize: 13,
              padding: const EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.topLeft,
            ),
            flexibleText(
              text: 'Area : ${mealData.strArea}',
              fontSize: 13,
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
            ),
          ],
        ),
        BookmarkButton(id: mealId, data: mealData),
      ],
    );
  }
}
