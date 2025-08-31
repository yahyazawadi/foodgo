import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPortionSelector extends StatelessWidget {
  const DetailPortionSelector({
    super.key,
    required this.portion,
    required this.onDec,
    required this.onInc,
  });

  final int portion;
  final VoidCallback onDec;
  final VoidCallback onInc;

  @override
  Widget build(BuildContext context) {
    final accentRed = Colors.red.shade400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Portion',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _SquareBtn(
              icon: Icons.remove,
              onTap: onDec,
              bg: Colors.white,
              iconColor: Colors.red,
            ),
            const SizedBox(width: 8),
            _PortionBox(portion: portion),
            const SizedBox(width: 8),
            _SquareBtn(
              icon: Icons.add,
              onTap: onInc,
              bg: accentRed,
              iconColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class _SquareBtn extends StatelessWidget {
  const _SquareBtn({
    required this.icon,
    required this.onTap,
    required this.bg,
    required this.iconColor,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color bg;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6),
          ],
        ),
        child: Center(child: Icon(icon, size: 20, color: iconColor)),
      ),
    );
  }
}

class _PortionBox extends StatelessWidget {
  const _PortionBox({required this.portion});
  final int portion;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4),
        ],
      ),
      child: Center(
        child: Text(
          '$portion',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
