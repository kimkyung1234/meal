import 'package:flutter/material.dart';
import 'package:meal/models/bookmark.dart';
import 'package:meal/pages/detail_page.dart';
import 'package:meal/services/db_helper.dart';
import 'package:meal/widgets/common.dart';
import 'package:provider/provider.dart';

class BookmarkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);

    return Column(
      children: [
        const SizedBox(height: 60),
        flexibleText(
          text: 'Bookmark',
          fontSize: 40,
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
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No bookmark'));
              }
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
                padding: const EdgeInsets.all(18),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (_, index) {
                  final data = snapshot.data?[index];
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                    key: ValueKey<int>(snapshot.data![index].id),
                    onDismissed: (DismissDirection direction) async {
                      await provider.deleteBookmark(snapshot.data![index].id);
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              id: data?.id.toString() ?? '',
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
                            carryImageWidget(
                              url: data?.url ?? '',
                              boxFit: BoxFit.scaleDown,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  flexibleText(
                                    text: data?.name ?? '',
                                    alignment: Alignment.topLeft,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
