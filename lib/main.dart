import 'package:dofood/pages/cart_page.dart';
import 'package:dofood/pages/home_screen.dart';
import 'package:dofood/pages/product_details.dart';
import 'package:dofood/pages/products_page.dart';
import 'package:dofood/pages/order_summay_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "foodGo",
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        'products': (context) => ProductsPage(),
        'product-details': (context) => ProductDetails(),
        'cart': (context) => CartPage(),
        'order-sumary': (context) => OrderSummary(),
        // I do not know if I might need those but we'll see
        // '/payment-methods': (context) => PaymentMethodsScreen(),
        // '/order-confirm': (context) => OrderConfirmationScreen(),
        // '/profile': (context) => ProfileScreen(),
        // '/support': (context) => SupportScreen(),
      },
    );
  }
}
