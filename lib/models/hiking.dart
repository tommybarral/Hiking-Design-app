
import 'package:flutter/foundation.dart';

class Hiking {
  final String id;
  final String title;
  final String imageUrl;
  final int like;
  final String description;
  final String location;
  final String country;
  final double price;

  Hiking({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.like,
    required this.description,
    required this.location,
    required this.country,
    required this.price,
});
}