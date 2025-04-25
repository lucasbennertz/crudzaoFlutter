import 'package:crud_app/app/model/product_model.dart';
import 'package:crud_app/app/utils/database_helper.dart';
import 'package:crud_app/app/utils/validators/insert_validators.dart';
import 'package:crud_app/app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
  
}

class _InsertScreenState extends State<InsertScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  final InsertValidators validador = InsertValidators();

  final DatabaseHelper banco = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                     decoration: InputDecoration(
                       labelText: "Nome do Produto",
                       border: OutlineInputBorder()
                     ),
                     validator: (value) => validador.validarNome(value),
                     controller: nameController,
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                     decoration: InputDecoration(
                       labelText: "Valor do Produto",
                       border: OutlineInputBorder()
                     ),
                     validator: (value) => validador.validarValor(value),
                     controller: valueController,
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          String value = valueController.text;
                          value = value.replaceAll(",", ".");
                          double valueDouble = double.parse(value);
                          var newProduct = ProductModel(productName: nameController.text, productValue: valueDouble);
                          banco.insertProduct(newProduct);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Produto Cadastrado Com sucesso"),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.black,
                            )
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black)
                      ),
                      child: Text("Inserir Produto", style: TextStyle(color: Colors.white),),
                      ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}