import '../../../Shared/Logic/Entity/plant.dart';

class PlantModel {
  final String? id;
  final String? name;
  final String? category;
  final double? price;
  final String? imageUrl;

  const PlantModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      category: json['category'] ?? "",
      price: json['price'] ?? 0.toDouble(),
      imageUrl: json['image_url'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  Plant toEntity() {
    return Plant(
      id: id ?? "",
      name: name ?? "",
      category: category ?? "",
      price: price ?? 0,
      imageUrl: imageUrl ?? "",
    );
  }
}
