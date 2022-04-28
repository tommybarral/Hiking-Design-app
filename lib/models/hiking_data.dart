import 'package:flutter/foundation.dart';
import 'package:hiking_design_app/models/hiking.dart';

class HikingData with ChangeNotifier {
  final List<Hiking> _hikingItems = [
    Hiking(
      id: 'h1',
      title: 'Cascade',
      imageUrl: 'https://assets.simpleviewinc.com/simpleview/image/fetch/q_75/https://assets.simpleviewinc.com/simpleview/image/upload/crm/roanoke/Cascade-Falls0_c0c7b90c-5056-a36a-0972ad73a70ce0b4.png',
      like: 1,
      description: 'Great cascade description there located in USA',
      location: 'Virginie',
      country: 'USA',
      price: 50,
    ),
    Hiking(
      id: 'h2',
      title: 'Yosemite',
      imageUrl: 'https://media.tacdn.com/media/attractions-content--1x-1/0b/27/ab/84.jpg',
      like: 5,
      description: 'Yosemite National Park is located in central Sierra Nevada in the US state of california. It is located near the wild protected areas.',
      location: 'California',
      country: 'USA',
      price: 250,
    ),
    Hiking(
      id: 'h3',
      title: 'lac',
      imageUrl: 'https://i2.wp.com/handluggageonly.co.uk/wp-content/uploads/2020/02/HandLuggageOnly-9-3.jpg?resize=1000%2C1500&ssl=1',
      like: 4,
      description: 'Great cascade description there located in Canada',
      location: 'Banff',
      country: 'Canada',
      price: 150,
    ),
    Hiking(
      id: 'h4',
      title: 'Yosemite',
      imageUrl: 'https://media.tacdn.com/media/attractions-content--1x-1/0b/27/ab/84.jpg',
      like: 5,
      description: 'Yosemite National Park is located in central Sierra Nevada in the US state of california. It is located near the wild protected areas.',
      location: 'California',
      country: 'USA',
      price: 250,
    ),
  ];

  List<Hiking> get hikingItem {
    return [..._hikingItems];
  }
}