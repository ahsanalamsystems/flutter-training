import 'package:flutter/material.dart';
import 'package:lecture_one/database/database.helper.dart';
import 'package:lecture_one/model/product.model.dart';

class ProductProvider with ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  late List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  Future<void> openDatabase() async {
    await _databaseHelper.open();
    _products = await _databaseHelper.getProducts();
    notifyListeners();
  }

  Future<void> getProducts() async {
    await _databaseHelper.open();
    _products = await _databaseHelper.getProducts();
    notifyListeners();
  }

  Future<void> insertProduct(ProductModel product) async {
    await _databaseHelper.open();
    await _databaseHelper.insertProduct(product);
    _products = await _databaseHelper.getProducts();
    notifyListeners();
  }

  Future<void> updateProduct(ProductModel product) async {
    await _databaseHelper.open();
    await _databaseHelper.updateProduct(product);
    _products = await _databaseHelper.getProducts();
    notifyListeners();
  }

  Future<void> deleteProducts(int id) async {
    await _databaseHelper.open();
    await _databaseHelper.deleteProduct(id);
    _products = await _databaseHelper.getProducts();
    notifyListeners();
  }
}
