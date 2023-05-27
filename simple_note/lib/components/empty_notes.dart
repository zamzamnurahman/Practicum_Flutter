import 'package:flutter/material.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
