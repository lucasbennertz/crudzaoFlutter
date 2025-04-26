import 'package:crud_app/app/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product, required this.carregarProdutos});

  final ProductModel product;
  final Function carregarProdutos;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.productName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )),
                Text(
                  "R\$ ${product.productValue.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700]
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async{
                    final result = await Navigator.of(context).pushNamed("/insert", arguments: {
                        'editMode' : true,
                        'product' : product
                    });
                    if(result == true){
                      carregarProdutos();
                    }
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.blue,
                  ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  )
              ],
            )
          ],
        ),
      )
    );
  }
}