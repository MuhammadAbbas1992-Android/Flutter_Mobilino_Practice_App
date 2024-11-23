class CartModel {
  late String id;
  late String url;
  late String name;
  late String price;
  late String quantity;

  CartModel({
    required this.id,
    required this.url,
    required this.name,
    required this.price,
    required this.quantity,
  });

  // Method to convert CartModel instance to a Map (e.g., for Firebase)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  // Factory constructor to create a CartModel from a Map (e.g., from Firebase)
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      quantity: json['quantity'] as String,
    );
  }
}
