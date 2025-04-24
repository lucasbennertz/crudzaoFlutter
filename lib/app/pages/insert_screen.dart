import 'package:crud_app/app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                     decoration: InputDecoration(
                       labelText: "Nome do Produto",
                       border: OutlineInputBorder()
                     ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                     decoration: InputDecoration(
                       labelText: "Valor do Produto",
                       border: OutlineInputBorder()
                     ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}