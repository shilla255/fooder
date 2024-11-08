// import 'package:flutter/material.dart';
// import 'package:fooder/presentation/view/add_to_cart/cart_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../add_to_cart/cart_model.dart';
// import 'dish_model.dart';
//
// class DishCardActions {
//   static void addToCart(BuildContext context, Dish dish, WidgetRef ref) {
//     ref.read(cartProvider.notifier).addItem(
//       CartItem(
//         id: dish.id,
//         name: dish.name,
//         price: dish.price, imageUrl: '',
//       ),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('${dish.name} added to cart')),
//     );
//   }
//
//   static void toggleFavorite(BuildContext context, Dish dish) {
//     final newStatus = !dish.isFavorite;
//     dish.isFavorite = newStatus;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(newStatus
//             ? '${dish.name} added to favorites'
//             : '${dish.name} removed from favorites'
//         ),
//       ),
//     );
//   }
//
//   static void showDishDetails(BuildContext context, Dish dish) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => DraggableScrollableSheet(
//         initialChildSize: 0.7,
//         minChildSize: 0.5,
//         maxChildSize: 0.9,
//         expand: false,
//         builder: (_, controller) => SingleChildScrollView(
//           controller: controller,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(dish.name, style: Theme.of(context).textTheme.headlineSmall),
//                 const SizedBox(height: 8),
//                 Text(dish.restaurantName, style: Theme.of(context).textTheme.titleMedium),
//                 const SizedBox(height: 16),
//                 Image.network(dish.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
//                 const SizedBox(height: 16),
//                 Text('Ingredients:', style: Theme.of(context).textTheme.titleLarge),
//                 ...dish.ingredients.map((ingredient) => Text('• $ingredient')),
//                 const SizedBox(height: 16),
//                 Text('Dietary Information:', style: Theme.of(context).textTheme.titleLarge),
//                 Wrap(
//                   spacing: 8,
//                   children: dish.dietaryInfo.map((info) => Chip(label: Text(info))).toList(),
//                 ),
//                 const SizedBox(height: 16),
//                 Text('Nutritional Information:', style: Theme.of(context).textTheme.titleLarge),
//                 ...dish.nutritionalInfo.entries.map((entry) =>
//                     Text('${entry.key}: ${entry.value}')
//                 ),
//                 const SizedBox(height: 16),
//                 Text('Preparation Time: ${dish.preparationTime} minutes',
//                     style: Theme.of(context).textTheme.titleMedium
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }