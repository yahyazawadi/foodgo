import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CartPage')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('CartPage')),
    );
  }
}
