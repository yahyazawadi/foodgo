import 'package:dofood/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    cartProvider
        .fetchCart()
        .then((_) {
          if (cartProvider.cart != null) {
            print('Cart Data:');
            print('Total Items: ${cartProvider.cart!.items.length}');
            print('Subtotal: \$${cartProvider.cart!.summary.subtotal}');
            print('Tax: \$${cartProvider.cart!.summary.tax}');
            print('Delivery Fee: \$${cartProvider.cart!.summary.deliveryFee}');
            print('Total: \$${cartProvider.cart!.summary.total}');

            for (var item in cartProvider.cart!.items) {
              print(
                'Item: ${item.name} - Quantity: ${item.quantity} - Price: \$${item.price}',
              );
            }
          }
        })
        .catchError((error) {
          print('Error fetching cart: $error');
        });
    return Scaffold(
      appBar: AppBar(title: const Text('CartPage')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('CartPage test')),
    );
  }
}
