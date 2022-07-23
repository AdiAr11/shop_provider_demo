import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _cartItem = {};

  Map<String, CartItem> get cartItem => {..._cartItem};

  void addItem(String productId, String title, double price) {
    if (_cartItem.containsKey(productId)) {
      _cartItem.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity + 1,
              price: value.price));
      
    } else {
      _cartItem.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  int numberOfItemsInCart(){
    return _cartItem.length;
  }

}
