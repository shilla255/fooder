import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../favorite_screen_view/favorite_model.dart';
import '../../../favorite_screen_view/favorite_provider.dart';
import 'restaurant_model.dart';
import 'restaurant_details_screen/restaurant_details_screen.dart';

class RestaurantHomeCard extends ConsumerWidget {
  final Restaurant restaurant;

  const RestaurantHomeCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 240,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetailsScreen(restaurant: restaurant),
            ),
          );
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Image.asset(
                        restaurant.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(CupertinoIcons.location_solid, size: 16),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                restaurant.location,
                                style: Theme.of(context).textTheme.bodyMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                restaurant.rating.floor(),
                                (index) => const Icon(
                                  CupertinoIcons.star_fill,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${restaurant.rating} (${restaurant.reviewCount} reviews)',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        if (restaurant.specialOffer != null)
                          Text(
                            restaurant.specialOffer!,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
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
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(2.0),
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.heart, color: Colors.red),
                    onPressed: () {
                      final favouriteItem = FavouriteItem(
                        category: 'restaurant',
                        name: restaurant.name,
                        details: restaurant.location,
                        imageUrl: restaurant.imageUrl,
                      );
                      ref.read(favouriteProvider.notifier).addFavourite(favouriteItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${restaurant.name} added to favourites')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}