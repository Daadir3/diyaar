import 'package:get/get.dart';

class PropertyModel {
  final String id;
  final String image;
  final String type;
  final String title;
  final String location;
  final double price;
  final double rating;
  RxBool isFavorite;

  PropertyModel({
    required this.id,
    required this.image,
    required this.type,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    bool favorite = false,
  }) : isFavorite = favorite.obs;

  // ✅ Convert to JSON for storage
  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'type': type,
        'title': title,
        'location': location,
        'price': price,
        'rating': rating,
        'isFavorite': isFavorite.value,
      };

  // ✅ Convert from JSON for loading
  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        id: json['id'],
        image: json['image'],
        type: json['type'],
        title: json['title'],
        location: json['location'],
        price: (json['price'] as num).toDouble(),
        rating: (json['rating'] as num).toDouble(),
        favorite: json['isFavorite'] ?? false,
      );
}
