import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Foodgo',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Order your favourite food!',
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=32'),
        ),
      ],
    ),
  );
}
