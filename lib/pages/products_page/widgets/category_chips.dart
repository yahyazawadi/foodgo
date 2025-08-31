import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final label = categories[i];
          final selected = label == selectedCategory;
          return ChoiceChip(
            label: Text(label),
            selected: selected,
            onSelected: (val) {
              onChanged(val ? label : 'All');
            },
            selectedColor: Colors.red.shade400,
            backgroundColor: Colors.grey.shade200,
            labelStyle: TextStyle(
              color: selected ? Colors.white : Colors.black87,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          );
        },
      ),
    );
  }
}
