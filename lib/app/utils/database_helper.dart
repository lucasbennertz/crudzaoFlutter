import 'package:crud_app/app/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> getDatabase() async{
    if(_database != null){
      return _database!;
    }else{
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path,'products_db'),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE products(
          productId INTEGER PRIMARY KEY AUTOINCREMENT,
          productName TEXT,
          productValue REAL
          );
        ''');
      },
      version: 2
      );
  }

  Future<void> insertProduct(ProductModel product) async{
    final db = await getDatabase();
    await db.insert(
      'products', 
      {
        'productName' : product.productName,
        'productValue' : product.productValue
      },
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  
  Future<List<ProductModel>> readProduct() async{
    final db = await getDatabase();
    final List<Map<String,dynamic>> result = await db.query('products');
    return result.map((map) => ProductModel.fromMap(map)).toList();
  }

  Future<void> updateProduct(ProductModel product) async{
    final db = await getDatabase();
    await db.update(
      'products',
    {
      'productName' : product.productName,
      'productValue' : product.productValue
    },
    where: 'productId = ?',
    whereArgs: [product.productId],
    conflictAlgorithm: ConflictAlgorithm.replace    
    );
  }
  Future<void> deleteProduct(ProductModel product) async{
    final db = await getDatabase();
    await db.delete(
      'products',
      where: 'productId = ?',
      whereArgs: [product.productId]
    );
  }
  Future<ProductModel> readOneProduct(String nomeProduto) async{
    List<ProductModel> produtos = await readProduct();
  return produtos.firstWhere(
    (prod) => prod.productName.contains(nomeProduto),
    orElse: () {
    throw Exception("Produto não encontrado");
    }
  );
  }
}