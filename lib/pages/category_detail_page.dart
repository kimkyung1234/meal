import 'package:flutter/material.dart';
import 'package:meal/widgets/common.dart';
import 'package:meal/widgets/recommend_card.dart';

class CategoryDetailPage extends StatelessWidget {
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;
  const CategoryDetailPage({
    Key? key,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          strCategory,
          style: const TextStyle(color: Colors.black),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          carryImageWidget(
            url: strCategoryThumb,
            boxFit: BoxFit.fill,
            radius: 0,
          ),
          const SizedBox(height: 10),
          flexibleText(
            text: strCategoryDescription,
            padding: const EdgeInsets.all(5),
          ),
          const SizedBox(height: 10),
          flexibleText(
            text: 'Related to $strCategory',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topLeft,
          ),
          RecommendCardWidget(inputText: strCategory),
        ],
      ),
    );
  }
}
