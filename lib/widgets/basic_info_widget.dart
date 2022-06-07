import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/pages/pages.dart';
import 'package:meal/services/api.dart';
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
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  flexibleText(
                    text: 'Category : ',
                    fontSize: 13,
                    fontFamily: 'Comfortaa',
                    alignment: Alignment.topLeft,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () async {
                      Meal data = await getMealDataByCategory(
                          inputText: mealData.strCategory!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryListPage(
                            dataList: data.lists!,
                            strCategory: mealData.strCategory!,
                          ),
                        ),
                      );
                    },
                    child: flexibleText(
                      text: mealData.strCategory!,
                      fontSize: 13,
                      fontFamily: 'Comfortaa',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  flexibleText(
                    text: 'Area : ',
                    fontSize: 13,
                    fontFamily: 'Comfortaa',
                    alignment: Alignment.topLeft,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AreaDetailPage(
                            area: mealData.strArea!,
                          ),
                        ),
                      );
                    },
                    child: flexibleText(
                      text: mealData.strArea!,
                      fontSize: 13,
                      fontFamily: 'Comfortaa',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        BookmarkButton(id: mealId, data: mealData),
      ],
    );
  }
}
