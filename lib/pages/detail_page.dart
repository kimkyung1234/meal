import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          style: TextStyle(color: Colors.black, fontFamily: 'Comfortaa'),
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
          var id = int.parse(data?.idMeal ?? '');
          assert(id is int);

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
                fontFamily: 'Comfortaa',
                fontSize: 28,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 20),
              ),
              BasicInfoWidget(
                mealId: id,
                mealData: data!,
              ),
              customDivider(),
              flexibleText(
                text: 'Ingredients',
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 26,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 5, bottom: 10),
              ),
              IngredientList(ingredients: data.ingredients!),
              customDivider(),
              flexibleText(
                text: 'Detail',
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 26,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 5, bottom: 10),
              ),
              flexibleText(
                text: data.strInstructions ?? 'No data',
                textColor: Colors.black87,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w100,
                fontSize: 18,
                padding: const EdgeInsets.all(5),
              ),
              const SizedBox(height: 25),
              data.strYouTube == "" || data.strYouTube == null
                  ? const SizedBox()
                  : Player(
                      videoID: YoutubePlayer.convertUrlToId(data.strYouTube!)!),
            ],
          );
        },
      ),
    );
  }
}
