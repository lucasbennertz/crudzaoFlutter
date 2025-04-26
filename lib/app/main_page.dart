import 'package:crud_app/app/pages/initial_page.dart';
import 'package:crud_app/app/pages/insert_screen.dart';
import 'package:crud_app/app/pages/read_only_one.dart';
import 'package:crud_app/app/pages/read_screen.dart';
import 'package:flutter/material.dart';
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => InitialPage(),
        '/insert': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return InsertScreen(editMode: args['editMode'], product: args['product'],);
          },
        '/read': (context) => ReadScreen(),
        '/readOnlyOne': (context) => ReadOnlyOne()
      },
    );
  }
}