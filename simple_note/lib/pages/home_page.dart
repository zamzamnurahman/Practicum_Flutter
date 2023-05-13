import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../component/card_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Simple Note Apps",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.edit_document,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text("Create Your Notes"),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed('addNote');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
