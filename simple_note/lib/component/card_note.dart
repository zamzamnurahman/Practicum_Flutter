import 'package:flutter/material.dart';

class CardNote extends StatelessWidget {
  const CardNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Title Note"),
      subtitle: const Text("Description Note"),
      trailing: const Text(
        "Created at : Monday, 23 April 2023",
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
