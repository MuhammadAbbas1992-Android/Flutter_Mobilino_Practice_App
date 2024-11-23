class ProductModel {
  late String id;
  late String imageUrl;
  late String category;
  late String name;
  late String price;
  late String description;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
  });

  // Convert a Product object to JSON format (Map)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'category': category,
      'name': name,
      'price': price,
      'description': description,
    };
  }

  // Convert JSON format (Map) to a Product object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
    );
  }
}
