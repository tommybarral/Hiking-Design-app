import 'package:flutter/foundation.dart';
import 'package:hiking_design_app/models/greet.dart';

class GreetData with ChangeNotifier {
  final List<Greet> _items = [
    Greet(
        title: 'Trips',
        subtitle: 'Discover',
        description: 'Mountain hikes give you an incredible pleasure of courage and conquer',
        imageUrl: 'https://d3rf6j5nx5r04a.cloudfront.net/1erWPkJcG6Dvku9ReeEq_A_ibJQ=/760x506/product/e/d/cdb3372fb791428b8122c65c96822f51_opt.jpg',
    ),
    Greet(
        title: 'Relax',
        subtitle: 'Yoga',
        description: 'Yoga exercices give you an incredible pleasure of relaxing and peace',
        imageUrl: 'https://cdn1.vectorstock.com/i/1000x1000/64/65/yoga-pose-abstract-color-background-vector-2266465.jpg',
    ),
    Greet(
        title: 'Trips',
        subtitle: 'Hiking',
        description: 'Hiking give you an incredible pleasure of communion with earth mother',
        imageUrl: 'https://img.freepik.com/free-vector/winter-hiking-abstract-illustration_335657-5560.jpg',
    ),
  ];

  List<Greet> get items {
    return [..._items];
  }
}