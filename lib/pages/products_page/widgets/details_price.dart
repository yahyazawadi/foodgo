import 'package:dofood/models/product_model.dart';
import 'package:dofood/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPriceAction extends StatelessWidget {
  final Product product;
  final int portion;
  final double spicy;

  const DetailPriceAction({
    super.key,
    required this.product,
    required this.portion,
    required this.spicy,
  });

  @override
  Widget build(BuildContext context) {
    final accentRed = Colors.red.shade400;
    final darkBrown = const Color(0xFF3B2F2F);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: accentRed,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: accentRed.withOpacity(0.3), blurRadius: 8),
            ],
          ),
          child: Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: product.available
                  ? darkBrown
                  : Colors.grey.shade400,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 4,
            ),
            onPressed: product.available
                ? () async {
                    final prov = Provider.of<ProductProvider>(
                      context,
                      listen: false,
                    );
                    try {
                      await prov.placeOrder(product.id, portion, spicy);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Order placed successfully!'),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to place order: $e'),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  }
                : null,
            child: Text(
              product.available ? 'ORDER NOW' : 'UNAVAILABLE',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
