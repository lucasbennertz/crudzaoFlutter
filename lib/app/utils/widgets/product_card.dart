import 'package:crud_app/app/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;
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
                  onPressed: (){},
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