import 'package:flutter/material.dart';

Widget buildBottomBar() {
  return BottomAppBar(
    height: 50,
    shape: const CircularNotchedRectangle(),
    notchMargin: 12,
    color: Colors.red.shade400,
    child: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          const SizedBox(width: 40),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
