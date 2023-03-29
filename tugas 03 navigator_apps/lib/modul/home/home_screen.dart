import 'package:flutter/material.dart';
import 'package:navigator_apps/modul/menu/menu_screen.dart';
import 'package:navigator_apps/modul/news/news_screen.dart';

import '../../models/user.dart';
import 'header_widget.dart';
import 'hotnews_widget.dart';
import 'lates_news_widget.dart';
import 'searchbar_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.user});

  User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;
  _selectedTabIndex(int value) {
    setState(() {
      _tabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: [
          ListView(
            children: [
              HeaderWidget(widget: widget),
              const SearchbarWidget(),
              const HotNewsWidget(),
              const LatesNewsWidget()
            ],
          ),
          const NewsScreen(),
          const MenuScreen(),
        ],
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  BottomNavigationBar bottomNavigation() {
    return BottomNavigationBar(
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
    );
  }
}
