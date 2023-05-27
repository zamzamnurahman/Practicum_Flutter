import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/extensions/format_date.dart';
import 'package:simple_note/services/database_service.dart';

import '../models/note.dart';

class AddNotePage extends StatefulWidget {
  Note? note;
  AddNotePage({super.key, this.note});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _titleCtrl;
  late TextEditingController _descriptionCtrl;
  @override
  void initState() {
    _titleCtrl = TextEditingController(text: widget.note?.title ?? "");
    _descriptionCtrl =
        TextEditingController(text: widget.note?.description ?? "");
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
        title: const Text("Notes"),
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
            Visibility(
              child: Text(
                widget.note!.createdAt.formatDate(),
                textAlign: TextAlign.end,
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
        onPressed: () async {
          Note note = Note(
            title: _titleCtrl.text,
            description: _descriptionCtrl.text,
            createdAt: DateTime.now().toIso8601String(),
          );
          if (widget.note != null) {
            await DatabaseServices().updateNote(note);
          } else {
            await DatabaseServices().addNote(note);
          }
          if (!mounted) return;
          GoRouter.of(context).pop();
        },
        label: Text(widget.note == null ? "Save Note" : "Update Note"),
      ),
    );
  }
}
