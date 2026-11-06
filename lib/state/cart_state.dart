import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartLine {
  final Product product;
  int qty;
  CartLine({required this.product, this.qty = 1});
}

class CartState extends ChangeNotifier {
  CartState._();
  static final CartState instance = CartState._();

  final List<CartLine> _lines = [];

  List<CartLine> get lines => List.unmodifiable(_lines);
  bool get isEmpty => _lines.isEmpty;
  bool get isNotEmpty => _lines.isNotEmpty;
  int get totalItems => _lines.fold(0, (sum, l) => sum + l.qty);
  double get totalPrice =>
      _lines.fold(0.0, (sum, l) => sum + l.product.price * l.qty);

  /// Adds [p] or increments qty of an existing line for the same product id.
  void add(Product p, {int qty = 1}) {
    final idx = _lines.indexWhere((l) => l.product.id == p.id);
    if (idx >= 0) {
      _lines[idx].qty += qty;
    } else {
      _lines.add(CartLine(product: p, qty: qty));
    }
    notifyListeners();
  }

  void increment(Product p) {
    final idx = _lines.indexWhere((l) => l.product.id == p.id);
    if (idx >= 0) {
      _lines[idx].qty++;
      notifyListeners();
    }
  }

  void decrement(Product p) {
    final idx = _lines.indexWhere((l) => l.product.id == p.id);
    if (idx < 0) return;
    if (_lines[idx].qty > 1) {
      _lines[idx].qty--;
    } else {
      _lines.removeAt(idx);
    }
    notifyListeners();
  }

  void remove(Product p) {
    _lines.removeWhere((l) => l.product.id == p.id);
    notifyListeners();
  }

  void clear() {
    _lines.clear();
    notifyListeners();
  }
}
