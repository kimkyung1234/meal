import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/common.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              customDivider(),
              flexibleText(
                text: data?.strInstructions ?? 'No data',
                textColor: Colors.black87,
                padding: const EdgeInsets.all(5),
              ),
              /*flexibleText(
                text: 'Related to ${data?.strCategory}',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topLeft,
              ),
              RecommendCardWidget(inputText: data?.strCategory ?? ''),*/
            ],
          );
        },
      ),
    );
  }
}
