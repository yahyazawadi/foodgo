import 'package:dofood/models/product_model.dart';

List<Product> filterProducts(
  List<Product> products,
  String query,
  String selectedCategory,
) {
  final q = query.trim().toLowerCase();

  return products.where((p) {
    final matchesQuery =
        q.isEmpty ||
        p.name.toLowerCase().contains(q) ||
        p.description.toLowerCase().contains(q);

    final matchesCategory =
        selectedCategory == 'All' ||
        p.category.toLowerCase() == selectedCategory.toLowerCase();

    return matchesQuery && matchesCategory;
  }).toList();
}

List<String> buildCategories(List<Product> products) {
  final set = <String>{};
  for (final p in products) {
    if (p.category.trim().isNotEmpty) {
      set.add(p.category);
    }
  }
  final cats = set.toList()
    ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  return ['All', ...cats];
}
