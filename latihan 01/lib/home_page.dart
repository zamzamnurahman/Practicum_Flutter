import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Home Page"),
        leading: MaterialButton(
          onPressed: () {},
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: FlutterLogo(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("Icon Button Active", name: "Icon Button Search");
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              log("Icon Button Active", name: "Icon Button menu");
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          decoration: BoxDecoration(
              color: Colors.green,
              // border: Border.all(),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ]),
          child: const Text(
            "Hello World",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
