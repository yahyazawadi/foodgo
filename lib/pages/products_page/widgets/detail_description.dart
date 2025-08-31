import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(color: Colors.grey[700], height: 1.4),
    );
  }
}
