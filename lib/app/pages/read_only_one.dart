import 'package:crud_app/app/model/product_model.dart';
import 'package:crud_app/app/utils/database_helper.dart';
import 'package:crud_app/app/utils/validators/insert_validators.dart';
import 'package:crud_app/app/utils/widgets/app_bar.dart';
import 'package:crud_app/app/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ReadOnlyOne extends StatefulWidget {
  const ReadOnlyOne({super.key});

  @override
  State<ReadOnlyOne> createState() => _ReadOnlyOneState();
}

class _ReadOnlyOneState extends State<ReadOnlyOne> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final InsertValidators validador = InsertValidators();

  final DatabaseHelper banco = DatabaseHelper();
  bool loadedProduct = false;
  late ProductModel product;
  
  _loadProduct(String nomeProduto) async {
    final loaded = await banco.readOneProduct(nomeProduto);
    setState(() {
      product = loaded;
      loadedProduct = true;
    });
    
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
                  SizedBox(height: 16,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () async{
                        if(_formKey.currentState!.validate()){
                          _loadProduct(nameController.text);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black)
                      ),
                      child: Text("Pesquisar produto", style: TextStyle(color: Colors.white),),
                      ),
                  )
                  ],
              ),
            )
            ),
            !loadedProduct ?
            Center(child: Text("Nenhum produto encontrado ou carregado")) :
            ProductCard(product: product, carregarProdutos: () => _loadProduct(product.productName), deletarProdutos: () async{
              //banco.deleteProduct(product);
              setState(() {
                loadedProduct = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Produto Deletado Com Sucesso", style: TextStyle(color: Colors.white),),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.black,
                  )
              );
            })
        ],
      ),
    );
  }
}