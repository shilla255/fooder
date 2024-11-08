
import 'package:flutter/material.dart';
import '../restaurant_model.dart';

class MenuItem {
  final String name;
  final String description;
  final double price;
  final String? imageUrl;

  MenuItem({required this.name, required this.description, required this.price, this.imageUrl});
}

class MenuSection extends StatelessWidget {
  final Restaurant restaurant;

  MenuSection({super.key, required this.restaurant});

  // Mock menu items
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Signature Dish',
      description: 'Our chef\'s special creation',
      price: 24.99,
      imageUrl: 'https://example.com/signature_dish.jpg',
    ),
    MenuItem(
      name: 'Vegetarian Delight',
      description: 'A medley of fresh vegetables',
      price: 18.99,
      imageUrl: 'https://example.com/vegetarian_delight.jpg',
    ),
    MenuItem(
      name: 'Dessert Surprise',
      description: 'Sweet treat to end your meal',
      price: 9.99,
      imageUrl: 'https://example.com/dessert_surprise.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: item.imageUrl != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            )
                : null,
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}