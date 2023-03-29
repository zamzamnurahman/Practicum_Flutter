import 'package:flutter/material.dart';

import 'home_screen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.widget,
  });

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Hi, Selamat Datang", style: TextStyle(fontSize: 12)),
      subtitle: Text(widget.user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
      trailing: CircleAvatar(
        foregroundImage: NetworkImage(widget.user.profileImage!),
      ),
    );
  }
}
