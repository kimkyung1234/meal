import 'package:flutter/material.dart';
import 'package:meal/models/models.dart';
import 'package:meal/providers/providers.dart';
import 'package:meal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BookmarkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);

    return Column(
      children: [
        const SizedBox(height: 60),
        flexibleText(
          text: 'Bookmark',
          fontSize: 40,
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        Expanded(
          child: FutureBuilder(
            future: provider.retrieveBookmark(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Bookmark>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: customCircularIndicator());
              } else if (snapshot.data?.length == 0) {
                return Center(
                    child: flexibleText(
                  text: 'No Bookmark',
                  fontWeight: FontWeight.bold,
                ));
              }
              return BookmarkList(
                dbHelper: provider,
                snapshot: snapshot,
              );
            },
          ),
        )
      ],
    );
  }
}
