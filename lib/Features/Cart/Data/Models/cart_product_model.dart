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
    required this.quantity,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0.toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      quantity: json['quantity'] ?? 1,
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

  factory CartProductModel.fromEntity(CartProduct entity) {
    return CartProductModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      price: entity.price,
      quantity: entity.quantity,
    );
  }
}
