import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../cart_page/cart_model.dart';
import '../../../cart_page/cart_provider.dart';
import '../../../favorite_screen_view/favorite_model.dart';
import '../../../favorite_screen_view/favorite_provider.dart';

import 'dish_model.dart';

class DishCard extends ConsumerWidget {
  final Dish dish;
  final Function(Dish) onAddToCart;

  const DishCard({
    super.key,
    required this.dish,
    required this.onAddToCart, required Null Function(dynamic dish) onToggleFavorite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 250,
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    dish.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish.name,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        dish.restaurantName,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text('${dish.rating} (${dish.reviewCount})'),
                          const Spacer(),
                          Text(
                            'TZS ${dish.price.toStringAsFixed(0)}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      if (dish.specialOffer != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            dish.specialOffer!,
                            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        dish.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                        color: dish.isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        final favouriteItem = FavouriteItem(
                          category: 'dish',
                          name: dish.name,
                          details: dish.restaurantName,
                          imageUrl: dish.imageUrl,
                        );
                        ref.read(favouriteProvider.notifier).addFavourite(favouriteItem);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${dish.name} added to favourites')),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.cart),
                      onPressed: () {
                        ref.read(cartProvider.notifier).addItem(
                          CartItem(
                            id: dish.id,
                            name: dish.name,
                            price: dish.price,
                            quantity: 1,
                            imageUrl: dish.imageUrl, // Ensure this is correctly set
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${dish.name} added to cart')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}