import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );

    productProvider
        .fetchProducts()
        .then((_) {
          if (productProvider.products.isNotEmpty) {
            print('Products Data:');
            print('Total Products: ${productProvider.products.length}');

            for (var product in productProvider.products) {
              print(
                'Product: ${product.name} - Price: \$${product.price} - Rating: ${product.rating}',
              );
              print('  Description: ${product.description}');
              print(
                '  Category: ${product.category} - Available: ${product.available}',
              );
            }
          }
        })
        .catchError((error) {
          print('Error fetching products: $error');
        });

    return Scaffold(
      appBar: AppBar(title: const Text('ProductsPage')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('ProductsPage')),
    );
  }
}
