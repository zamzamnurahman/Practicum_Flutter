import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/extensions/format_date.dart';
import 'package:simple_note/services/database_service.dart';

import '../models/note.dart';

class CardNote extends StatelessWidget {
  final Note note;
  final Function(DismissDirection)? onDismissed;
  const CardNote({
    super.key,
    required this.onDismissed,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.key.toString()),
      background: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      onDismissed: onDismissed,
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          note.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          note.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          "Created at : \n${note.createdAt.formatDate()}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10),
        ),
        onTap: () {
          context.goNamed('addNote', extra: note);
        },
        onLongPress: () {
          alertRemoveNotes(context);
        },
      ),
    );
  }

  Future<dynamic> alertRemoveNotes(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remove Note ?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.pop(context);
              await DatabaseServices().deleteNote(note);
            },
            child: const Text("Remove"),
          )
        ],
      ),
    );
  }
}
