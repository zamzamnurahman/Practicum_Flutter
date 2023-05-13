import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/pages/add_note_page.dart';
import 'package:simple_note/pages/home_page.dart';

class Approutes {
  static const home = "home";
  static const addNote = "addNote";

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomePage(),
    );
  }

  static Page _addNotePageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: AddNotePage(),
    );
  }

  static GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: home,
        path: "/",
        pageBuilder: _homePageBuilder,
        routes: [
          GoRoute(
            name: addNote,
            path: 'add-note',
            pageBuilder: _addNotePageBuilder,
          ),
        ],
      ),
    ],
  );
}
