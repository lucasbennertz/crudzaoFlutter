class ProductModel {
  final int? productId;
  final String productName;
  final double productValue;

  ProductModel({this.productId, required this.productName, required this.productValue});
  

  Map<String, dynamic> toMap(){
    return {
      'productId' : productId,
      'productName' : productName,
      'productValue' : productValue
    };
  }
  factory ProductModel.fromMap(Map<String, dynamic> map){
    return ProductModel(
      productId: map['productId'],
      productName: map['productName'],
      productValue: map['productValue']
      );
  }
}