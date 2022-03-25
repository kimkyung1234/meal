import 'package:flutter/material.dart';
import 'package:meal/models/bookmark.dart';
import 'package:meal/pages/detail_page.dart';
import 'package:meal/services/db_helper.dart';
import 'package:meal/widgets/common.dart';
// import 'package:meal/models/category.dart';
// import 'package:meal/pages/category_detail_page.dart';
// import 'package:meal/services/api.dart';
// import 'package:meal/widgets/common.dart';
import 'package:provider/provider.dart';

class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);

    return Column(
      children: [
        const SizedBox(height: 120),
        RaisedButton(
          onPressed: () {
            provider.deleteAllBookmark();
          },
          child: Text('delete'),
        ), // 52952
        RaisedButton(
          onPressed: () {
            provider.test(789);
          },
          child: Text('test'),
        ),
        Expanded(
          child: FutureBuilder(
            future: provider.retrieveBookmark(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Bookmark>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: customCircularIndicator());
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
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Icon(Icons.delete_forever),
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
