import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../main.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var category in _categories)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _buildCategoryItem(context, category, themeMode),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, Map<String, String> category, ThemeMode themeMode) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or category selection
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeMode == ThemeMode.light ? Colors.white : Colors.grey[800],
              boxShadow: [
                BoxShadow(
                  color: themeMode == ThemeMode.light ? Colors.grey.withOpacity(0.3) : Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                category['image']!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category['name']!.tr(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  static const _categories = [
    {"image": "assets/images/categories/breakfast.jpeg", "name": "breakfast"},
    {"image": "assets/images/categories/lunch.jpeg", "name": "lunch"},
    {"image": "assets/images/categories/dinner.jpg", "name": "dinner"},
    {"image": "assets/images/categories/seafoods.jpeg", "name": "seafood"},
    {"image": "assets/images/categories/snacks.jpeg", "name": "cakes"},
    {"image": "assets/images/categories/drinks.png", "name": "drinks"},
    {"image": "assets/images/categories/fruits.jpeg", "name": "fruits"},
    {"image": "assets/images/categories/vegetable.webp", "name": "vegetables"},
    {"image": "assets/images/categories/meat.jpg", "name": "meat"},
    {"image": "assets/images/categories/snacks.jpeg", "name": "snacks"},
    {"image": "assets/images/categories/appetizer.jpg", "name": "appetizer"},
  ];
}