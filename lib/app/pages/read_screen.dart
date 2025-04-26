import 'package:crud_app/app/model/product_model.dart';
import 'package:crud_app/app/utils/database_helper.dart';
import 'package:crud_app/app/utils/widgets/app_bar.dart';
import 'package:crud_app/app/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final DatabaseHelper banco = DatabaseHelper();

late Future<List<ProductModel>> productsList = Future.value([]);
  @override
  void initState(){
    super.initState();
    _loadProducts();
  }
  
  void _loadProducts() async{
    await banco.getDatabase();
    setState(() {
      productsList = banco.readProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: FutureBuilder<List<ProductModel>>(
        future: productsList,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text("Erro: ${snapshot.error}"),);
          }else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(child: Text("Nenhum produto Encontrado"),);
          } else{
            final produtos = snapshot.data!;
            return ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return ProductCard(product: produto, carregarProdutos: _loadProducts, deletarProdutos: () async {
                  await banco.deleteProduct(produto);
                  print("peoduto deletado");
                });
              },
              
              );
          }
          
        },
      ),
    );
  }
}