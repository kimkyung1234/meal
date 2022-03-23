import 'package:flutter/material.dart';
import 'package:meal/models/category.dart';
import 'package:meal/pages/category_detail_page.dart';
import 'package:meal/services/api.dart';
import 'package:meal/widgets/common.dart';

class CategoryCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Category>(
      future: getCategoryData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: customCircularIndicator());
        }

        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.categories?.length ?? 0,
            itemBuilder: (context, index) {
              final data = snapshot.data?.categories?[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailPage(
                          strCategory: data?.strCategory ?? '',
                          strCategoryThumb: data?.strCategoryThumb ?? '',
                          strCategoryDescription:
                              data?.strCategoryDescription ?? '',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      carryImageWidget(url: data?.strCategoryThumb ?? ''),
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
                              text: data?.strCategory ?? '',
                              fontSize: 20,
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
        /*return SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: snapshot.data?.categories?.length ?? 0,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (_, index) {
              final data = snapshot.data?.categories?[index];
              return Transform.scale(
                scale: 0.9,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailPage(
                          strCategory: data?.strCategory ?? '',
                          strCategoryThumb: data?.strCategoryThumb ?? '',
                          strCategoryDescription:
                              data?.strCategoryDescription ?? '',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      carryImageWidget(url: data?.strCategoryThumb ?? ''),
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
                              text: data?.strCategory ?? '',
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
              );
            },
          ),
        );*/
      },
    );
  }
}
