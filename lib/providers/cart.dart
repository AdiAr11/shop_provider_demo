import 'package:flutter/material.dart';
import 'package:shop_provider_demo/models/cart_item.dart';


class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItem = {};

  Map<String, CartItem> get cartItem => {..._cartItem};

  void addItem(String productId, String title, double price, String imageUrl) {
    if (_cartItem.containsKey(productId)) {
      _cartItem.update(
          productId,
          (value) => CartItem(
              imageUrl: value.imageUrl,
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
              imageUrl: imageUrl,
              price: price));
    }
    notifyListeners();
  }

  int numberOfItemsInCart() {
    return _cartItem.length;
  }

  double totalPrice() {
    double total = 0;
    for (var item in _cartItem.values) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void incrementQuantity(String productId) {
    _cartItem.update(
        productId,
        (value) => CartItem(
            imageUrl: value.imageUrl,
            id: value.id,
            title: value.title,
            quantity: value.quantity + 1,
            price: value.price));
    // _cartItem[productId] = _cartItem[productId].quantity++;
    notifyListeners();
  }

  void removeItem(String productId){
    _cartItem.remove(productId);
    notifyListeners();
  }

  void decrementQuantity(String productId, BuildContext context) {
    if (_cartItem[productId]?.quantity == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text(
              'Are you sure you want to remove the product from Cart?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _cartItem.remove(productId);
                notifyListeners();
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      _cartItem.update(
          productId,
          (value) => CartItem(
              imageUrl: value.imageUrl,
              id: value.id,
              title: value.title,
              quantity: value.quantity - 1,
              price: value.price));
    }
    notifyListeners();
  }
  void clearCart(){
    _cartItem = {};
    notifyListeners();
  }
}
