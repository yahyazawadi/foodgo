class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviews;
  final String image;
  final String category;
  final List<String> ingredients;
  final int calories;
  final String preparationTime;
  final int spicyLevel;
  final bool vegetarian;
  final bool available;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.category,
    required this.ingredients,
    required this.calories,
    required this.preparationTime,
    required this.spicyLevel,
    required this.vegetarian,
    required this.available,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      image: json['image'],
      category: json['category'],
      ingredients: List<String>.from(json['ingredients']),
      calories: json['calories'],
      preparationTime: json['preparationTime'],
      spicyLevel: json['spicyLevel'],
      vegetarian: json['vegetarian'],
      available: json['available'],
    );
  }
}
