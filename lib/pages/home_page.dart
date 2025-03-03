import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_feed_page.dart';
import 'my_like_page.dart';
import 'my_profile_page.dart';
import 'my_search_page.dart';
import 'my_upload_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          MyFeedPage(),
          MySearchPage(),
          MyUploadPage(pageController: _pageController,),
          MyLikePage(),
          MyProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        selectedItemColor: Color.fromRGBO(193, 53, 132, 1),
        currentIndex: currentIndex,
        elevation: 20,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            _pageController.animateToPage(
              currentIndex,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 32),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded, size: 32),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 32),
            label: "Like",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 32),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
