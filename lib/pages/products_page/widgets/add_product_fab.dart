import 'package:flutter/material.dart';

class AddProductFAB extends StatelessWidget {
  const AddProductFAB({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.red.shade400,
      child: const Icon(Icons.add),
    );
  }
}
