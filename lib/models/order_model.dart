class Order {
  final String orderId;
  final String orderDate;
  final String status;
  final Map<String, dynamic> customer;
  final Map<String, dynamic> deliveryAddress;
  final List<dynamic> items;
  final Map<String, dynamic> pricing;
  final Map<String, dynamic> payment;
  final Map<String, dynamic> delivery;
  final Map<String, dynamic> restaurant;
  final String specialInstructions;
  final String estimatedDelivery;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.status,
    required this.customer,
    required this.deliveryAddress,
    required this.items,
    required this.pricing,
    required this.payment,
    required this.delivery,
    required this.restaurant,
    required this.specialInstructions,
    required this.estimatedDelivery,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      orderDate: json['orderDate'],
      status: json['status'],
      customer: json['customer'],
      deliveryAddress: json['deliveryAddress'],
      items: json['items'],
      pricing: json['pricing'],
      payment: json['payment'],
      delivery: json['delivery'],
      restaurant: json['restaurant'],
      specialInstructions: json['specialInstructions'],
      estimatedDelivery: json['estimatedDelivery'],
    );
  }
}
