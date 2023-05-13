import 'package:flutter/material.dart';
import 'package:simple_note/services/database_service.dart';

import '../models/note.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _titleCtrl;
  late TextEditingController _descriptionCtrl;
  @override
  void initState() {
    _titleCtrl = TextEditingController();
    _descriptionCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Add new notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleCtrl,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
              ),
            ),
            // const Divider(thickness: 1),
            TextFormField(
              keyboardType: TextInputType.multiline,
              controller: _descriptionCtrl,
              minLines: null,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Description",
                border: InputBorder.none,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          DatabaseService.db.addNewNotes(Note());
        },
        label: const Text("Save Note"),
      ),
    );
  }
}
