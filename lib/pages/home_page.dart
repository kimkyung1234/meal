import 'package:flutter/material.dart';
import 'package:meal/widgets/card/random_card.dart';
import 'package:meal/widgets/common.dart';
import 'package:meal/widgets/list/area_card_list.dart';
import 'package:meal/widgets/list/category_card_list.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        flexibleText(
          text: 'Home',
          fontSize: 40,
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        RandomCardWidget(),
        flexibleText(
          text: 'Area',
          fontSize: 28,
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        AreaCardListWidget(),
        flexibleText(
          text: 'Category',
          fontSize: 28,
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        CategoryCardListWidget(),
      ],
    );
  }
}
