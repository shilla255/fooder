import 'package:flutter/material.dart';
import '../restaurant_model.dart';
import 'menu_section.dart';
import 'rating_special_offers.dart';
import 'reservation_widget.dart';
import 'review_section_widget.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(restaurant.name),
              background: Image.asset(
                restaurant.imageUrl, // Use asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  RatingAndOffers(restaurant: restaurant),
                  const SizedBox(height: 16),
                  ReservationWidget(restaurant: restaurant),
                  const SizedBox(height: 24),
                  Text(
                    'Menu',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  MenuSection(restaurant: restaurant),
                  const SizedBox(height: 24),
                  Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  ReviewSection(restaurant: restaurant),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}