import 'package:flutter/material.dart';
import 'package:dofood/models/product_model.dart';

class DetailQuickFacts extends StatelessWidget {
  const DetailQuickFacts({super.key, required this.p});
  final Product p;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.local_fire_department,
              size: 18,
              color: Colors.redAccent,
            ),
            const SizedBox(width: 6),
            Text(
              '${p.calories} cal',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            Icon(
              p.vegetarian ? Icons.eco : Icons.no_food,
              size: 18,
              color: p.vegetarian ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 6),
            Text(
              p.vegetarian ? 'Vegetarian' : 'Non veg',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
