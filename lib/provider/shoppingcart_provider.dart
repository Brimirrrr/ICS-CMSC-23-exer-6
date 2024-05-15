import 'package:flutter/material.dart';
import '../model/Item.dart';

class ShoppingCart extends ChangeNotifier {
  final List<Item> _cart = [];

  List<Item> get cart => _cart;

  double get totalPrice => _cart.fold(0, (total, current) => total + current.price);

  void addItem(Item item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeItem(String name) {
    _cart.removeWhere((item) => item.name == name);
    notifyListeners();
  }

  void removeAll() {
    _cart.clear();
    notifyListeners();
  }
}
