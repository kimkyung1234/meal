import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/pages/pages.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/widgets.dart';

class RandomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Meal>(
      future: getRandomMealData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circularIndicatorWidget(height: 400);
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
                        carryImageWidget(
                            url: data?.strMealThumb ?? '',
                            boxFit: BoxFit.cover),
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
                                Colors.black.withOpacity(0.38),
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
                                fontFamily: 'Comfortaa',
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
