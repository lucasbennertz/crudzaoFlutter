import 'package:crud_app/app/model/product_model.dart';
import 'package:crud_app/app/utils/database_helper.dart';
import 'package:crud_app/app/utils/validators/insert_validators.dart';
import 'package:crud_app/app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InsertScreen extends StatefulWidget {
  InsertScreen({super.key, required this.editMode, this.product});

  final bool editMode;
  ProductModel? product;

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
  void initState(){
    super.initState();
    if(widget.editMode && widget.product != null){
      nameController.text = widget.product!.productName;
      valueController.text = widget.product!.productValue.toString();
    }
  }
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
                        if(_formKey.currentState!.validate() && !widget.editMode){
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
                        }else if(_formKey.currentState!.validate() && widget.editMode){
                          String value = valueController.text;
                          value = value.replaceAll(",", ".");
                          double valueDouble = double.parse(value);
                          var newProduct = ProductModel(productName: nameController.text, productValue: valueDouble, productId: widget.product!.productId);
                          banco.updateProduct(newProduct);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Produto alterado com sucesso"),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.black,
                            )
                          );
                          Navigator.pop(context, true);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black)
                      ),
                      child: Text(widget.editMode ? "Salvar alterações" : "Inserir Produto", style: TextStyle(color: Colors.white),),
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