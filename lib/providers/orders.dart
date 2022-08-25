import 'package:flutter/material.dart';
import 'package:shop_provider_demo/models/cart_item.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(this.id, this.amount, this.products, this.dateTime);
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders => _orders;

  void addOrder(List<CartItem> cartProducts, double total) {
    OrderItem orderItem = OrderItem(
        DateTime.now().toString(), total, cartProducts, DateTime.now());
    _orders.insert(0, orderItem);
    notifyListeners();
  }
}
