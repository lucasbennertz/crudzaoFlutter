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
          productId INTEGER PRIMARY KEY AUTOINCREMENT,
          productName TEXT,
          productValue REAL
        ''');
      },
      version: 1
      );
  }

  Future<void> insertProduct(ProductModel product) async{
    final db = await _database;
    await db!.insert(
      'products', 
      {
        'productName' : product.productName,
        'productValue' : product.productValue
      },
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  
  Future<List<Map<String,dynamic>>> readProduct() async{
    final db = _database;
    return await db!.query('products');
  }
}