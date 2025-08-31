import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPriceAction extends StatelessWidget {
  const DetailPriceAction({
    super.key,
    required this.price,
    required this.isAvailable,
    required this.accentRed,
    required this.darkBrown,
  });

  final double price;
  final bool isAvailable;
  final Color accentRed;
  final Color darkBrown;

  @override
  Widget build(BuildContext context) {
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
            '\$${price.toStringAsFixed(2)}',
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
              backgroundColor: isAvailable ? darkBrown : Colors.grey.shade400,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 4,
            ),
            onPressed: isAvailable ? () {} : null,
            child: Text(
              isAvailable ? 'ORDER NOW' : 'UNAVAILABLE',
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
