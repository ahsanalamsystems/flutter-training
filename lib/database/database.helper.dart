import 'package:lecture_one/model/product.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> open() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'products.db');

    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          name TEXT,
          price REAL,
          description TEXT
        )
      ''');
    });
  }

  Future<List<ProductModel>> getProducts() async {
    final List<Map<String, dynamic>> maps = await _database.query('products');
    return List.generate(maps.length, (i) {
      return ProductModel(
          maps[i]['id'] as int,
          maps[i]['name'] as String,
          (maps[i]['price'] as num).toDouble(),
          maps[i]['description'] as String);
    });
  }

  Future<void> insertProduct(ProductModel product) async {
    await _database.insert(
      'products',
      {
        'name': product.name,
        'price': product.price,
        'description': product.description
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateProduct(ProductModel product) async {
    return await _database.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    return await _database.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
