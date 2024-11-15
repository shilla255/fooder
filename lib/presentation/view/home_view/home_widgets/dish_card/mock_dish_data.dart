import 'dish_model.dart';

List<Dish> mockDishes = [
  Dish(
    id: '1',
    name: 'Chapati na maziwa',
    imageUrl: 'assets/images/categories/breakfast.jpeg',
    restaurantName: 'Mama Lishe Kinondoni',
    price: 2.99,
    rating: 4.8,
    reviewCount: 75,
    ingredients: ['Chapati', 'Maziwa'],
    dietaryInfo: ['vegetarian'],
    nutritionalInfo: {'calories': 150, 'protein': 5, 'carbs': 20, 'fat': 7},
    preparationTime: 15,
  ),
  Dish(
    id: '2',
    name: 'Wali nazi',
    imageUrl: 'assets/images/categories/lunch.jpeg',
    restaurantName: 'Kariakoo Special',
    price: 3.99,
    rating: 4.7,
    reviewCount: 95,
    ingredients: ['Rice', 'Coconut milk'],
    dietaryInfo: ['gluten-free'],
    nutritionalInfo: {'calories': 250, 'protein': 6, 'carbs': 50, 'fat': 8},
    preparationTime: 20,
  ),
  Dish(
    id: '3',
    name: 'Fried chicken',
    imageUrl: 'assets/images/categories/dinner.jpg',
    restaurantName: 'Mama Jane’s Grill',
    price: 5.99,
    rating: 4.6,
    reviewCount: 110,
    ingredients: ['Chicken', 'Spices'],
    dietaryInfo: ['non-vegetarian'],
    nutritionalInfo: {'calories': 400, 'protein': 25, 'carbs': 5, 'fat': 30},
    preparationTime: 25,
  ),
  Dish(
    id: '4',
    name: 'Samaki wa kukaanga',
    imageUrl: 'assets/images/categories/seafoods.jpeg',
    restaurantName: 'Ocean Breeze',
    price: 6.99,
    rating: 4.9,
    reviewCount: 120,
    ingredients: ['Fish', 'Lemon', 'Garlic'],
    dietaryInfo: ['pescatarian'],
    nutritionalInfo: {'calories': 350, 'protein': 40, 'carbs': 0, 'fat': 15},
    preparationTime: 30,
  ),
  Dish(
    id: '5',
    name: 'Chocolate cake',
    imageUrl: 'assets/images/categories/snacks.jpeg',
    restaurantName: 'Sweet Tooth Bakery',
    price: 3.99,
    rating: 4.5,
    reviewCount: 80,
    ingredients: ['Chocolate', 'Flour', 'Sugar'],
    dietaryInfo: ['vegetarian'],
    nutritionalInfo: {'calories': 350, 'protein': 4, 'carbs': 50, 'fat': 15},
    preparationTime: 40,
  ),
  // Add other dishes using the rest of the images...
];
