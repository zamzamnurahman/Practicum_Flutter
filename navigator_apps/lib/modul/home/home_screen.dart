import 'package:flutter/material.dart';

import '../../models/user.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.user});

  User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categories = [
    "School",
    "Tech",
    "Literature",
    "Nature",
    "Gen-z",
    "Car",
    "Sport",
    "Game",
  ];

  int _tabIndex = 0;
  _selectedTabIndex(int value) {
    setState(() {
      _tabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        body: Column(
          children: [
            orientation == Orientation.portrait
                ? Container(
                    height: MediaQuery.of(context).padding.top,
                  )
                : const SizedBox(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabIndex,
          onTap: _selectedTabIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "News",
              icon: Icon(Icons.newspaper),
            ),
            BottomNavigationBarItem(
              label: "Menu",
              icon: Icon(Icons.menu),
            )
          ],
        ),
      );
    });
  }
}
