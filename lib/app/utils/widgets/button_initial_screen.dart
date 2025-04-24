import 'package:flutter/material.dart';

class ButtonInitialScreen extends StatelessWidget {
  const ButtonInitialScreen({super.key, required this.buttonText, required this.caminhoTela});

  final String buttonText;
  final String caminhoTela;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(caminhoTela);
        },
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: WidgetStatePropertyAll(Colors.black)
        ),
        child: Text(buttonText, style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.016,),
        ),
    ));
  }
}