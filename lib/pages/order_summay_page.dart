import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OrderSummayPage')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('OrderSummayPage')),
    );
  }
}
