import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFFE9099), Color(0xFFEF2A39)],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.2),
          child: Text(
            'Foodgo',
            style: GoogleFonts.lobster(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
        ),

        Positioned(
          left: 0,
          bottom: -35,

          child: Image.asset('assets/burgers.png', width: 275, height: 275),
        ),
      ],
    );
  }
}
