import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/pages/detail_page.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/common.dart';

class RandomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Meal>(
      future: getRandomMealData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data?.lists?[0];
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: Transform.scale(
                  scale: 0.9,
                  child: GestureDetector(
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
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        carryImageWidget(url: data?.strMealThumb ?? ''),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0),
                                Colors.white.withOpacity(0),
                                Colors.white.withOpacity(0),
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.5)
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              flexibleText(
                                text: data?.strMeal ?? '',
                                fontSize: 30,
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
