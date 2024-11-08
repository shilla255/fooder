// restaurant.dart

class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String cuisineType;
  final String description;
  final String? specialOffer;
  final String location; // Add location field

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.cuisineType,
    required this.description,
    this.specialOffer,
    required this.location, // Update constructor
  });
}