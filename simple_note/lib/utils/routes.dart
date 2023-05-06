import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/pages/home_page.dart';

class Approutes {
  static const home = "home";

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomePage(),
    );
  }

  static GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/"),
      GoRoute(
        name: home,
        path: "/",
        pageBuilder: _homePageBuilder,
      ),
    ],
  );
}
