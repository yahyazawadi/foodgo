import 'package:dofood/models/product_model.dart';
import 'package:dofood/api/product_api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      final productApi = GetIt.instance<ProductApi>();
      _products = await productApi.getProducts();
    } catch (e) {
      debugPrint('Error fetching products: $e');
      _products = [];
    } finally {
      notifyListeners();
    }
  }

  Future<void> placeOrder(int productId, int portion, double spicy) async {
    try {
      final productApi = GetIt.instance<ProductApi>();
      await productApi.confirmOrder({
        "productId": productId,
        "portion": portion,
        "spicyLevel": spicy,
      });
      debugPrint("Order placed successfully!");
    } catch (e) {
      debugPrint("Error placing order: $e");
    }
  }
}
