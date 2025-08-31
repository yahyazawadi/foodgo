import 'package:flutter/material.dart';
import 'package:dofood/models/product_model.dart';
import 'package:dofood/pages/products_page/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
    required this.isFavorite,
    required this.onTap,
    required this.onToggleFavorite,
  });

  final List<Product> products;
  final bool Function(int id) isFavorite;
  final void Function(Product p) onTap;
  final void Function(int id) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final item = products[index];
        return ProductCard(
          item: item,
          isFavorite: isFavorite(item.id),
          onTap: () => onTap(item),
          onToggleFavorite: () => onToggleFavorite(item.id),
        );
      },
    );
  }
}
