import 'package:dofood/api/dependency_locator.dart';
import 'package:dofood/pages/products_page/products_page.dart';
import 'package:dofood/providers/cart_provider.dart';
import 'package:dofood/providers/order_provider.dart';
import 'package:dofood/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
      ],
      child: MaterialApp(
        title: "foodGo",
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductPage(),
        routes: {
          'products': (context) => ProductPage(),
          // due to changing and unclear requirments, none of these pages were implemented
          // '/home': (context) => HomeScreen(),
          // 'cart': (context) => CartPage(),
          // 'order-sumary': (context) => OrderSummary(),
          //'product-details': (context) => ProductDetails(),
          // I do not know if I might need those but we'll see
          // '/payment-methods': (context) => PaymentMethodsScreen(),
          // '/order-confirm': (context) => OrderConfirmationScreen(),
          // '/profile': (context) => ProfileScreen(),
          // '/support': (context) => SupportScreen(),
        },
      ),
    );
  }
}
