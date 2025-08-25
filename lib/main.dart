import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "foodGo",
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      routes: 
  {
        '/' :(context) => HomeScreen(),
         'products': (context) => ProductsPage(),
         'product-details':(context) => ProductDetails(),
         'cart': (context) => CartPage(),
          'order-sumary': (context) => OrderSummary(),
        // i do not know if I might need those 
        //   '/payment-methods': (context) => PaymentMethodsScreen(),
        // '/order-confirm': (context) => OrderConfirmationScreen(),
        // '/profile': (context) => ProfileScreen(),
        // '/support': (context) => SupportScreen(),
      }
    )
  }

 
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen")),
      body: Center(
        child: Text("home screen"),
      ) 
    ),),},}
      
    
  
  


