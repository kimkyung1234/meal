import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/widgets/widgets.dart';

class CategoryListPage extends StatelessWidget {
  final List<Food> dataList;
  final String strCategory;
  const CategoryListPage({
    Key? key,
    required this.dataList,
    required this.strCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          strCategory,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: Colors.black),
        ),
      ),
      body: MealList(dataList: dataList),
    );
  }
}
