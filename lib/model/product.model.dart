class ProductModel {
  int id;
  String name;
  double price;
  String description;

  ProductModel(this.id, this.name, this.price, this.description);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(map['id'], map['name'],
        (map['price'] as num).toDouble(), map['description']);
  }
}
