import 'package:flutter/material.dart';
import 'package:lecture_one/database/product.provider.dart';
import 'package:lecture_one/model/product.model.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  Future<void> _showAddProductDialog(BuildContext context,
      {ProductModel? product}) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    if (product != null) {
      nameController.text = product.name;
      priceController.text = product.price.toString();
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product == null ? 'Add Product' : 'Update Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Product Price'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Product Price'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (product == null) {
                  final newProduct = ProductModel(
                      0,
                      nameController.text,
                      double.parse(priceController.text),
                      descriptionController.text);
                  await Provider.of<ProductProvider>(context, listen: false)
                      .insertProduct(newProduct);
                } else {
                  final updatedProduct = ProductModel(
                      product.id,
                      nameController.text,
                      double.parse(priceController.text),
                      descriptionController.text);
                  await Provider.of<ProductProvider>(context, listen: false)
                      .updateProduct(updatedProduct);
                }
                Navigator.pop(context); // Close the dialog
              },
              child: Text(product == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                icon: const Icon(Icons.add, size: 30),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  _showAddProductDialog(context);
                },
              ),
            )
          ],
        ),
        body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
              return ListView.builder(
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Icon(
                                      Icons.edit,
                                      color: Colors.lightBlueAccent,
                                    )
                                  ],
                                ),
                                Text(
                                  product.description,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text('Rs${product.price}'),
                              ]),
                        ),
                      )
                    ],
                  );
                },
              );
            })));
  }
}
