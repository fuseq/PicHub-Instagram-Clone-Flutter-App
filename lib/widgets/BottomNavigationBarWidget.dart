import 'package:flutter/material.dart';
import 'package:pichub/pages/add_post_screen.dart';
import 'package:pichub/pages/igtv_screen.dart';
import 'package:pichub/pages/message_page.dart';
import 'package:pichub/pages/profile_base_screen_page.dart';
import 'package:pichub/pages/reels_page.dart';
import '../pages/feed_screen.dart';
import '../pages/explore_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FeedScreen(),
    ExplorePage(),  
    AddPostScreen(),
    ReelsPage(),
    ProfileBaseScreenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue, // Set the selected icon color to blue
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/add.png',
                width: 25,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/video.png',
                width: 25,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/user3.png',
                width: 30,
              ),
              label: ''),
        ],
      ),
    );
  }
}