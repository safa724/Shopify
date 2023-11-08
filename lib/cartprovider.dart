

import 'package:flutter/material.dart';

class Cart<T> extends ChangeNotifier{
  final List<T> _items = [];

  // Get the current items in the cart
  List<T> get items => _items;

  // Add an item to the cart
  void addItem(T item) {
    _items.add(item);
  }

  // Remove an item from the cart
  void removeItem(T item) {
    _items.remove(item);
  }

  // Clear the cart
  void clearCart() {
    _items.clear();
  }
}
