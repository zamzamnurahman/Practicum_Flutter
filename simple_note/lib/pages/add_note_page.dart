import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/extensions/format_date.dart';
import 'package:simple_note/services/database_service.dart';

import '../models/note.dart';

class AddNotePage extends StatefulWidget {
  final Note? note;
  const AddNotePage({super.key, this.note});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _titleCtrl;
  late TextEditingController _descriptionCtrl;
  late final String _temporaryTitle;
  final FocusNode _descriptionFocus = FocusNode();
  bool isEdit = false;
  @override
  void initState() {
    _titleCtrl = TextEditingController(text: widget.note?.title ?? "");
    _descriptionCtrl =
        TextEditingController(text: widget.note?.description ?? "");
    _temporaryTitle = widget.note?.title ?? "";
    isEdit = widget.note?.title == null;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Notes"),
          actions: [
            IconButton(
                onPressed: () {
                  if (isEdit) {
                    isEdit = false;
                    _titleCtrl.text = _temporaryTitle;
                    FocusScope.of(context).unfocus();
                  } else {
                    isEdit = true;
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  }
                  setState(() {});
                },
                icon: Icon(isEdit ? Icons.close : Icons.edit)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextFormField(
                readOnly: !isEdit,
                controller: _titleCtrl,
                minLines: null,
                maxLines: null,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
              if (widget.note != null)
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    const SizedBox(width: 5),
                    Text(
                      widget.note!.createdAt.formatDate(),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              // const Divider(thickness: 1),
              TextFormField(
                readOnly: !isEdit,
                focusNode: _descriptionFocus,
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
        floatingActionButton: !isEdit
            ? const SizedBox()
            : FloatingActionButton.extended(
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
      ),
    );
  }
}
