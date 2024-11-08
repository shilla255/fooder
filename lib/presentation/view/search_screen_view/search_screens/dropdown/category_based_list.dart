import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home_view/home_screen/restaurant/mock_restaurant_data.dart';
import '../../../home_view/home_screen/restaurant/restaurant_card_widget.dart';
import 'category_dropdown.dart'; // From Step 1


import '../../../home_view/home_widgets/dish_card/mock_dish_data.dart';
import '../../../home_view/home_widgets/dish_card/dish_card_widget.dart';

class CategoryBasedList extends ConsumerWidget {
  const CategoryBasedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);

    return Column(
      children: [
        CategoryDropdown(),
        Expanded(
          child: _buildCategoryContent(selectedCategory),
        ),
      ],
    );
  }

  Widget _buildCategoryContent(String category) {
    if (category == 'Hotels') {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildHotelCard(index);
        },
      );
    } else if (category == 'Restaurants') {
      return ListView.builder(
        itemCount: mockRestaurants.length,
        itemBuilder: (context, index) {
          return RestaurantHomeCard(restaurant: mockRestaurants[index]);
        },
      );
    } else if (category == 'Chefs') {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildChefCard(index);
        },
      );
    } else if (category == 'Dishes') {
      return ListView.builder(
        itemCount: mockDishes.length,
        itemBuilder: (context, index) {
          return DishCard(
            dish: mockDishes[index],
            onAddToCart: (dish) {
              // Handle add to cart logic
            },
            onToggleFavorite: (dish) {
              // Handle toggle favorite logic
            },
          );
        },
      );
    } else {
      return const Center(child: Text('Select a category'));
    }
  }

  Widget _buildHotelCard(int index) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.hotel),
        title: Text('Hotel Name $index'),
        subtitle: const Text('Hotel description here'),
      ),
    );
  }

  Widget _buildChefCard(int index) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text('Chef Name $index'),
        subtitle: const Text('Specialized in cakes and wedding catering'),
      ),
    );
  }
}