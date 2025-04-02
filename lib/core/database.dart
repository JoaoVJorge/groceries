import 'dart:convert';

import 'package:equatable/equatable.dart';

class GroceryItem extends Equatable {
  const GroceryItem({
    required this.imageUrl,
    required this.name,
    required this.calories,
    required this.price,
    required this.type,
    required this.isAvailable,
    required this.description,
  });
  final String imageUrl;
  final String name;
  final double calories;
  final double price;
  final String type;
  final bool isAvailable;
  final String description;

  @override
  List<Object?> get props =>
      [imageUrl, name, calories, price, type, isAvailable, description];
}

class Review extends Equatable {
  const Review({
    required this.user,
    required this.rating,
    required this.description,
    required this.date,
    required this.item,
  });
  final UserEntity user;
  final int rating;
  final String? description;
  final String date;
  final GroceryItem item;
  @override
  List<Object?> get props => [user, rating, description, date, item];
}

class UserEntity extends Equatable {
  // Create UserEntity from a JSON string
  factory UserEntity.fromJson(final String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserEntity(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
  const UserEntity({
    required this.imageUrl,
    required this.name,
  });

  final String name;
  final String imageUrl;

  @override
  List<Object?> get props => [name, imageUrl];

  // Convert UserEntity to a JSON string
  String toJson() {
    final map = {
      'name': name,
      'imageUrl': imageUrl,
    };
    return jsonEncode(map);
  }
}

final List<UserEntity> allUsers = [
  const UserEntity(
    imageUrl: "assets/images/foto.png",
    name: "Jorge",
  ),
];

final List<Review> allReviews = [
  Review(
    user: allUsers[0],
    rating: 1,
    description: "i Not just Liked it but i loved it!",
    date: "19:21",
    item: allGroceryItems[0],
  ),
];

final List<GroceryItem> allGroceryItems = [
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Apple",
    calories: 52.0,
    price: 1.99,
    type: "Fruit",
    isAvailable: false,
    description: "Crisp and sweet red apples, perfect for snacks or baking.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Banana",
    calories: 89.0,
    price: 0.99,
    type: "Fruit",
    isAvailable: true,
    description: "Naturally sweet and packed with potassium, great for energy.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Whole Wheat Bread",
    calories: 247.0,
    price: 2.49,
    type: "Wheat",
    isAvailable: true,
    description: "Nutritious and fiber-rich bread for a healthy diet.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Milk",
    calories: 103.0,
    price: 3.29,
    type: "Dairy",
    isAvailable: true,
    description: "Fresh and creamy milk, rich in calcium and vitamins.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Cheese",
    calories: 402.0,
    price: 4.99,
    type: "Dairy",
    isAvailable: true,
    description: "Delicious and versatile cheese for sandwiches or cooking.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Eggs",
    calories: 155.0,
    price: 2.99,
    type: "Meat",
    isAvailable: false,
    description: "Farm-fresh eggs, ideal for breakfast or baking.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Orange",
    calories: 47.0,
    price: 1.49,
    type: "Fruit",
    isAvailable: false,
    description: "Juicy and vitamin C-rich, great for immunity.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Chicken Breast",
    calories: 165.0,
    price: 5.99,
    type: "Meat",
    isAvailable: true,
    description: "Lean and protein-packed, perfect for grilling or frying.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Rice",
    calories: 130.0,
    price: 3.89,
    type: "Vegetable",
    isAvailable: true,
    description: "Versatile and filling, a staple in many cuisines.",
  ),
  const GroceryItem(
    imageUrl: "assets/images/morango_sem.png",
    name: "Salmon",
    calories: 208.0,
    price: 8.99,
    type: "Meat",
    isAvailable: true,
    description: "Rich in omega-3, great for heart health and grilling.",
  ),
];

List<String> typeOfItems(final List<GroceryItem> allGroceryItems) {
  final List<String> types = [];

  for (var item in allGroceryItems) {
    if (!types.contains(item.type)) {
      types.add(item.type);
    }
  }
  return types;
}
