import 'package:flutter/foundation.dart';
import 'models.dart';

class CartModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();
  int get count => _items.values.fold(0, (s, i) => s + i.qty);
  double get total =>
      _items.values.fold(0.0, (s, i) => s + i.product.price * i.qty);
  int qtyOf(String id) => _items[id]?.qty ?? 0;

  void add(Product p) {
    final existing = _items[p.id];
    if (existing == null) {
      _items[p.id] = CartItem(p, 1);
    } else {
      existing.qty++;
    }
    notifyListeners();
  }

  void remove(Product p) {
    final existing = _items[p.id];
    if (existing == null) return;
    existing.qty--;
    if (existing.qty <= 0) _items.remove(p.id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

/// Single app-wide cart instance.
final cart = CartModel();
