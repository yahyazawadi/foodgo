class CartItem {
  final int id;
  final int productId;
  final String name;
  final double price;
  final int quantity;
  final String image;
  final List<String> customizations;
  final double subtotal;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.customizations,
    required this.subtotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      name: json['name'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      image: json['image'],
      customizations: List<String>.from(json['customizations']),
      subtotal: json['subtotal'].toDouble(),
    );
  }
}

class CartSummary {
  final int itemCount;
  final double subtotal;
  final double tax;
  final double deliveryFee;
  final double serviceFee;
  final double discount;
  final double total;

  CartSummary({
    required this.itemCount,
    required this.subtotal,
    required this.tax,
    required this.deliveryFee,
    required this.serviceFee,
    required this.discount,
    required this.total,
  });

  factory CartSummary.fromJson(Map<String, dynamic> json) {
    return CartSummary(
      itemCount: json['itemCount'],
      subtotal: json['subtotal'].toDouble(),
      tax: json['tax'].toDouble(),
      deliveryFee: json['deliveryFee'].toDouble(),
      serviceFee: json['serviceFee'].toDouble(),
      discount: json['discount'].toDouble(),
      total: json['total'].toDouble(),
    );
  }
}

class Cart {
  final List<CartItem> items;
  final CartSummary summary;

  Cart({required this.items, required this.summary});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      summary: CartSummary.fromJson(json['summary']),
    );
  }
}
