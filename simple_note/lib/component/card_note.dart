import 'package:flutter/material.dart';
import 'package:simple_note/services/database_service.dart';

import '../models/note.dart';

class CardNote extends StatelessWidget {
  final Note note;
  const CardNote({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(note.title),
      subtitle: Text(note.description),
      trailing: Text(
        "Created at : ${note.createdAt}",
        style: const TextStyle(fontSize: 10),
      ),
      onTap: () {
        showDialog(
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
      },
    );
  }
}
