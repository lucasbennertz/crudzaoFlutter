import 'package:crud_app/app/utils/widgets/app_bar.dart';
import 'package:crud_app/app/utils/widgets/button_initial_screen.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ButtonInitialScreen(buttonText: "Insert", caminhoTela: "/insert",),
                ButtonInitialScreen(buttonText: "Read, Update and Delete", caminhoTela: "/read")
              ],
            ),
          )
        ],
      ),
    );
  }
}