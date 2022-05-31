import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/widgets/widgets.dart';

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
              fontFamily: 'Comfortaa',
              padding: const EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 5),
            flexibleText(
              text: 'Area : ${mealData.strArea}',
              fontSize: 13,
              fontFamily: 'Comfortaa',
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
