// dish_model.dart

class Dish {
  final String id;
  final String name;
  final String imageUrl;
  final String restaurantName;
  final double price;
  final double rating;
  final int reviewCount;
  final String? specialOffer;
  bool isFavorite;
  final List<String> ingredients;
  final List<String> dietaryInfo;
  final Map<String, double> nutritionalInfo;
  final int preparationTime;  // in minutes

  Dish({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.restaurantName,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.specialOffer,
    this.isFavorite = false,
    required this.ingredients,
    required this.dietaryInfo,
    required this.nutritionalInfo,
    required this.preparationTime,
  });

  Dish copyWith({bool? isFavorite}) {
    return Dish(
      id: this.id,
      name: this.name,
      imageUrl: this.imageUrl,
      restaurantName: this.restaurantName,
      price: this.price,
      rating: this.rating,
      reviewCount: this.reviewCount,
      specialOffer: this.specialOffer,
      isFavorite: isFavorite ?? this.isFavorite,
      ingredients: this.ingredients,
      dietaryInfo: this.dietaryInfo,
      nutritionalInfo: this.nutritionalInfo,
      preparationTime: this.preparationTime,
    );
  }
}