class ProductModel {
  late int productId;
  late String productName;
  late double productValue;

  ProductModel({productId, required productName, required productValue});
  
  ProductModel.semId({required productName, required productValue});

  Map<String, dynamic> toMap(){
    return {
      'productId' : productId,
      'productName' : productName,
      'productValue' : productValue
    };
  }
}