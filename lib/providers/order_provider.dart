import 'package:dofood/models/product_model.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get product => _products;
  final List<Map<String, dynamic>> _mockProducts = [
    {
      "id": 1,
      "name": "Cheeseburger Wendy's Burger",
      "description":
          "Classic fast food burger with fresh ground beef, melted cheese, crispy lettuce, ripe tomatoes, pickles, and our signature sauce on a toasted sesame seed bun.",
      "price": 8.24,
      "rating": 4.5,
      "reviews": 285,
      "image": "/images/product1.png",
      "category": "Burgers",
      "ingredients": [
        "Beef Patty",
        "Cheese",
        "Lettuce",
        "Tomato",
        "Pickles",
        "Sesame Bun",
      ],
      "calories": 540,
      "preparationTime": "8-12 minutes",
      "spicyLevel": 1,
      "vegetarian": false,
      "available": true,
    },
  ];
  Future<void> fetchProducts() async {
    //notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));

      // Convert mock data to Product objects
      _products = _mockProducts
          .map((product) => Product.fromJson(product))
          .toList();
    } catch (e) {
      print(e);
      _products = [];
    } finally {
      notifyListeners();
    }
  }
}
