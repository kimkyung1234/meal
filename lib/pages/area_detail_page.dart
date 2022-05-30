import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/pages/detail_page.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/common.dart';
import 'package:meal/widgets/square_image.dart';

class AreaDetailPage extends StatelessWidget {
  final String area;
  const AreaDetailPage({
    Key? key,
    required this.area,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          area,
          style: const TextStyle(color: Colors.black),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: Colors.black),
        ),
      ),
      body: FutureBuilder<Meal>(
        future: getMealDataByArea(area: area),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: customCircularIndicator());
          } else if (snapshot.data?.lists?.length == null) {
            return Center(
                child: flexibleText(
              text: 'No data',
              fontWeight: FontWeight.bold,
            ));
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            padding: const EdgeInsets.all(18),
            itemCount: snapshot.data?.lists?.length ?? 0,
            itemBuilder: (_, index) {
              final data = snapshot.data?.lists?[index];
              return GestureDetector(
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 130,
                  child: Row(
                    children: <Widget>[
                      SquareImage(url: data?.strMealThumb ?? ''),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            flexibleText(
                              text: data?.strMeal ?? '',
                              alignment: Alignment.topLeft,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
