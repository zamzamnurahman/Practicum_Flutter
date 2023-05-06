import 'package:flutter/material.dart';
import 'package:simple_note/utils/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Simple Note",
      routeInformationParser: Approutes.router.routeInformationParser,
      routerDelegate: Approutes.router.routerDelegate,
      routeInformationProvider: Approutes.router.routeInformationProvider,
    );
  }
}
