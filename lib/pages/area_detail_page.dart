import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/widgets.dart';

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
          return MealList(
            snapshot: snapshot,
            categorVisible: false,
          );
        },
      ),
    );
  }
}
