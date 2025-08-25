import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProductDetails')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('ProductDetails')),
    );
  }
}
