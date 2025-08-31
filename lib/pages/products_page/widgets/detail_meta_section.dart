import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dofood/models/product_model.dart';

class DetailMetaSection extends StatelessWidget {
  const DetailMetaSection({super.key, required this.p});
  final Product p;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                p.name,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 16),
            const SizedBox(width: 6),
            Text(
              '${p.rating.toStringAsFixed(1)}',
              style: GoogleFonts.poppins(fontSize: 13),
            ),
            const SizedBox(width: 8),
            Text(
              '(${p.reviews})',
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(width: 12),
            Text(
              p.preparationTime,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
