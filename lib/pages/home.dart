import 'package:flutter/material.dart';
import 'package:meal/providers/page.dart';
import 'package:meal/widgets/area_card.dart';
import 'package:meal/widgets/bookmark_list.dart';
import 'package:meal/widgets/category_card.dart';
import 'package:meal/widgets/common.dart';
import 'package:meal/widgets/random_card.dart';
import 'package:meal/widgets/search_widget.dart';
// import 'package:meal/widgets/search_widget.dart';
// import 'package:path/path.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    ListView(
      children: [
        const SizedBox(height: 20),
        flexibleText(
          text: 'Home',
          fontSize: 40,
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        RandomCardWidget(),
        flexibleText(
          text: 'Area',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        AreaCardWidget(),
        flexibleText(
          text: 'Category',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        CategoryCardWidget(),
      ],
    ),
    BookmarkList(),
    Column(children: [
      const SizedBox(height: 120),
      flexibleText(
        text: 'Search',
        padding: const EdgeInsets.all(15),
        alignment: Alignment.topLeft,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      const SizedBox(height: 30),
      SearchWidget(),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _children[provider.getCurrentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        onTap: provider.onTabTapped,
        currentIndex: provider.getCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Bookmark'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }
}
