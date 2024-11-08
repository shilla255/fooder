// review_section.dart

import 'package:flutter/material.dart';

import '../restaurant_model.dart';


class ReviewSection extends StatelessWidget {
  final Restaurant restaurant;

  const ReviewSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display existing reviews
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3, // Show only top 3 reviews
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text('U${index + 1}')),
              title: Text('User ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < 4 ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.amber,
                      );
                    }),
                  ),
                  const Text('Great food and atmosphere!'),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _showReviewDialog(context),
          child: const Text('Write a Review'),
        ),
      ],
    );
  }

  void _showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Write a Review'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You can only leave a review if you have ordered from this restaurant.'),
              const SizedBox(height: 16),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Share your experience...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: const Icon(Icons.star_border),
                    onPressed: () {
                      // Handle star rating
                    },
                  );
                }),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                // Handle review submission
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}