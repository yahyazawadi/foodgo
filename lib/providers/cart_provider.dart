import 'package:dofood/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Cart? _cart;
  Cart? get cart => _cart;

  int get itemCount => _cart?.items.length ?? 0;
  // here I added mock data instead of using the api as a plan to integrate the api later on
  final Map<String, dynamic> _mockCart = {
    "items": [
      {
        "id": 1,
        "productId": 1,
        "name": "Cheeseburger Wendy's Burger",
        "price": 8.24,
        "quantity": 2,
        "image": "/images/product1.png",
        "customizations": ["Extra cheese", "No pickles"],
        "subtotal": 16.48,
      },
    ],
    "summary": {
      "itemCount": 4,
      "subtotal": 42.97,
      "tax": 3.44,
      "deliveryFee": 2.99,
      "serviceFee": 1.5,
      "discount": 0,
      "total": 50.9,
    },
  };

  Future<void> fetchCart() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _cart = Cart.fromJson(_mockCart);
    } catch (e) {
      print(e);

      _cart = null;
    } finally {
      notifyListeners();
    }
  }
}
