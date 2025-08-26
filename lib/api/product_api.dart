import 'package:dofood/api/api_client.dart';
import 'package:dofood/models/product_model.dart';

class ProductApi {
  final ApiClient _apiClient;

  ProductApi(this._apiClient);

  Future<List<Product>> getProducts() async {
    final response = await _apiClient.get('/api/products');
    return (response.data as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }

  Future<Product> getProductById(String id) async {
    final response = await _apiClient.get('/api/products/$id');
    return Product.fromJson(response.data);
  }
}
