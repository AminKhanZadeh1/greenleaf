import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';

class CartProductModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  CartProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }

  CartProduct toEntity() {
    return CartProduct(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      quantity: quantity,
    );
  }
}
