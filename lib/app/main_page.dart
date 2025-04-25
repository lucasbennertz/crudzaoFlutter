import 'package:crud_app/app/pages/initial_page.dart';
import 'package:crud_app/app/pages/insert_screen.dart';
import 'package:crud_app/app/pages/read_screen.dart';
import 'package:flutter/material.dart';
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => InitialPage(),
        '/insert': (context) => InsertScreen(),
        '/read': (context) => ReadScreen()
      },
    );
  }
}