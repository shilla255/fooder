// rating_and_offers.dart

import 'package:flutter/material.dart';

import '../restaurant_model.dart';



class RatingAndOffers extends StatelessWidget {
  final Restaurant restaurant;

  const RatingAndOffers({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 8),
                Text(
                  '${restaurant.rating} (${restaurant.reviewCount} reviews)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Cuisine: ${restaurant.cuisineType}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            if (restaurant.specialOffer != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.local_offer, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        restaurant.specialOffer!,
                        style: TextStyle(color: Colors.green.shade800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}