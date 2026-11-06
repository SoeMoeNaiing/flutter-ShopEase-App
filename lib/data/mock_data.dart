import '../models/product.dart';

class MockData {
  static const List<Product> products = [
    Product(
      id: 'p1', name: 'Wireless Headphones Pro', price: 129.99, rating: 4.7, reviews: 234,
      category: 'Audio',
      description: 'Immersive sound with active noise cancellation. 40-hour battery life, plush ear cushions and Bluetooth 5.3 for seamless pairing.',
      image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&q=80',
    ),
    Product(
      id: 'p2', name: 'Smart Watch Series 5', price: 199.00, rating: 4.5, reviews: 187,
      category: 'Wearable',
      description: 'Track workouts, heart rate and sleep with a bright AMOLED display. Water-resistant up to 50m with 7-day battery.',
      image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&q=80',
    ),
    Product(
      id: 'p3', name: 'Classic Denim Jacket', price: 79.50, rating: 4.3, reviews: 98,
      category: 'Fashion',
      description: 'Timeless fit, premium cotton blend and reinforced stitching. Pairs with anything from t-shirts to knitwear.',
      image: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&q=80',
    ),
    Product(
      id: 'p4', name: 'Coffee Maker Deluxe', price: 89.99, rating: 4.8, reviews: 412,
      category: 'Kitchen',
      description: 'Brew rich, barista-grade coffee at home. Programmable timer, 12-cup carafe and reusable filter included.',
      image: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&q=80',
    ),
    Product(
      id: 'p5', name: 'Running Sneakers', price: 64.99, rating: 4.6, reviews: 321,
      category: 'Sports',
      description: 'Lightweight mesh upper with responsive cushioning. Designed for daily runs and all-day comfort.',
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&q=80',
    ),
    Product(
      id: 'p6', name: 'Aviator Sunglasses', price: 49.00, rating: 4.4, reviews: 156,
      category: 'Accessories',
      description: 'Polarized lenses with UV400 protection and a durable metal frame. Comes with a premium leather case.',
      image: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400&q=80',
    ),
    Product(
      id: 'p7', name: 'Explorer Backpack', price: 59.99, rating: 4.7, reviews: 205,
      category: 'Travel',
      description: '30L water-resistant backpack with padded laptop sleeve, USB charging port and breathable back panel.',
      image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&q=80',
    ),
    Product(
      id: 'p8', name: 'Portable Speaker Mini', price: 39.99, rating: 4.5, reviews: 88,
      category: 'Audio',
      description: 'Pocket-sized Bluetooth speaker with punchy bass, IPX7 waterproofing and 12-hour playtime.',
      image: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&q=80',
    ),
  ];

  static const List<Map<String, String>> banners = [
    {'title': 'Mega Sale', 'subtitle': 'Up to 50% off everything',
     'image': 'https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?w=200&q=80'},
    {'title': 'New Arrivals', 'subtitle': 'Fresh drops every week',
     'image': 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=200&q=80'},
    {'title': 'Free Shipping', 'subtitle': 'On orders over \$50',
     'image': 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=200&q=80'},
  ];

  static const String userAvatar = 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&q=80';
  static const String shopAvatar = 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=200&q=80';

  static const String aboutText =
      'ShopEase was founded in 2020 with one simple goal — to make online shopping fast, fair and friendly. '
      'We hand-pick every product in our catalog and ship from local warehouses so your orders arrive in days, not weeks. '
      'With over 50,000 happy customers and a 4.9-star average service rating, we are proud to be your everyday marketplace. '
      'No gimmicks, no hidden fees — just great products at great prices.';
}
