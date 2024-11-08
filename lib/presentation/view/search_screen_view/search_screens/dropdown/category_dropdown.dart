import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the categories
const List<String> categories = ['Hotels', 'Restaurants', 'Chefs', 'Dishes'];

// Define the provider to manage selected category
final categoryProvider = StateProvider<String>((ref) => categories[0]);

class CategoryDropdown extends ConsumerWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButton<String>(
        value: selectedCategory,
        isExpanded: true,
        onChanged: (newValue) {
          ref.read(categoryProvider.notifier).state = newValue!;
        },
        items: categories.map<DropdownMenuItem<String>>((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(
              category,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      ),
    );
  }
}