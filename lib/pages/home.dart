import 'package:flutter/material.dart';
import 'package:meal/pages/home_page.dart';
import 'package:meal/providers/page.dart';
import 'package:meal/pages/bookmark_list_page.dart';
import 'package:meal/widgets/common.dart';
import 'package:meal/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    HomePageView(),
    BookmarkListPage(),
    Column(children: [
      const SizedBox(height: 120),
      flexibleText(
        text: 'Search',
        fontFamily: 'Comfortaa',
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
