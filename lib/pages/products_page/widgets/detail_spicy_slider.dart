import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailSpicySlider extends StatelessWidget {
  const DetailSpicySlider({
    super.key,
    required this.spicy,
    required this.onChanged,
  });

  final double spicy;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final accentRed = Colors.red.shade400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Spicy', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
          ),
          child: Slider(
            min: 0,
            max: 100,
            value: spicy,
            activeColor: accentRed,
            inactiveColor: Colors.green,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mild',
                style: TextStyle(color: Colors.green[700], fontSize: 12),
              ),
              Text(
                'Hot',
                style: TextStyle(color: Colors.red[700], fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
