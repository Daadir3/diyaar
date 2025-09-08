// lib/app/models/property_model.dart
class PropertyModel {
  final String id;
  final String image;
  final String type;
  final String title;
  final String location;
  final double price;
  final double rating;
  bool isFavorite;

  PropertyModel({
    required this.id,
    required this.image,
    required this.type,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    this.isFavorite = false,
  });

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['id']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
      type: map['type']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      location: map['location']?.toString() ?? '',
      price: _toDouble(map['price']),
      rating: _toDouble(map['rating']),
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'type': type,
      'title': title,
      'location': location,
      'price': price,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }
}
