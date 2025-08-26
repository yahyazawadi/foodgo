import 'package:dofood/api/dependency_locator.dart';
import 'package:dofood/pages/LoadingScreen.dart';
import 'package:dofood/pages/cart_page.dart';
import 'package:dofood/pages/home_screen.dart';
import 'package:dofood/pages/product_details.dart';
import 'package:dofood/pages/products_page.dart';
import 'package:dofood/pages/order_summay_page.dart';
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
        home: LoadingScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
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
      ),
    );
  }
}
