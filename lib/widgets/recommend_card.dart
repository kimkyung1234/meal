import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/common.dart';

class RecommendCardWidget extends StatelessWidget {
  final String inputText;
  const RecommendCardWidget({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Meal>(
      future: getMealDataByCategory(inputText: inputText),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: snapshot.data?.lists?.length ?? 0,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (_, index) {
              final data = snapshot.data?.lists?[index];
              return Transform.scale(
                scale: 0.9,
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      carryImageWidget(url: data?.strMealThumb ?? ''),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            flexibleText(
                              text: data?.strMeal ?? '',
                              fontSize: 21,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
