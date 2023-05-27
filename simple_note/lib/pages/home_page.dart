import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_note/services/database_service.dart';

import '../components/card_note.dart';
import '../components/empty_notes.dart';
import '../models/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseServices dbService = DatabaseServices();
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Simple Note Apps",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box("notesBox").listenable(),
        builder: (context, box, child) {
          if (box.isEmpty) {
            return const EmptyNotes();
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Note note = box.getAt(index);
                return Dismissible(
                  key: Key(note.key.toString()),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (_) {
                    dbService.deleteNote(note).then(
                          (value) => ScaffoldMessenger.of(_key.currentContext!)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                "Note ${note.title} successfuly deleted",
                              ),
                            ),
                          ),
                        );
                  },
                  child: CardNote(note: note),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await GoRouter.of(context).pushNamed('addNote');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
