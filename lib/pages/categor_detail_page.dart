import 'package:flutter/material.dart';
import 'package:meal/widgets/common.dart';

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
          flexibleText(
            text: 'Category : $strCategory',
            fontSize: 13,
            padding: const EdgeInsets.only(left: 10, top: 20),
            alignment: Alignment.topLeft,
          ),
          flexibleText(
            text: strCategoryDescription,
            padding: const EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
