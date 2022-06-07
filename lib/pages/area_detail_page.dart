import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/widgets.dart';

class AreaDetailPage extends StatelessWidget {
  final String area;

  AreaDetailPage({
    Key? key,
    required this.area,
  }) : super(key: key);

  TextEditingController editingController = TextEditingController();

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
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 10),
          //   child: IconButton(
          //     icon: const Icon(
          //       Icons.search,
          //       color: Colors.black,
          //       size: 28,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
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
            dataList: snapshot.data!.lists!,
            categorVisible: false,
          );
        },
      ),
    );
  }
}
