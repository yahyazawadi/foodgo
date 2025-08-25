import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProductsPage')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('ProductsPage')),
    );
  }
}
