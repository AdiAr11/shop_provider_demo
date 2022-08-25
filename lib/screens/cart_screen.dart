import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider_demo/models/cart_item.dart';
import 'package:shop_provider_demo/providers/cart.dart';
import 'package:shop_provider_demo/providers/orders.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chat_screen";

  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    List<CartItem> cartItems = cart.cartItem.values.toList();
    List<String> cartItemsKeys = cart.cartItem.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const Spacer(),
                  Chip(
                      label:
                          Text('\$ ${cart.totalPrice().toStringAsFixed(2)}')),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false)
                            .addOrder(cartItems, cart.totalPrice());
                        cart.clearCart();
                      },
                      child: const Text("Order Now"))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, i) {
                  return Dismissible(
                    key: ValueKey(cartItems[i].id),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cart.removeItem(cartItemsKeys[i]);
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: Image.network(cartItems[i].imageUrl)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                cartItems[i].title,
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "\$${cartItems[i].price}",
                                style: const TextStyle(fontSize: 17.0),
                              ),
                              Text(
                                "Total Price: \$${(cartItems[i].price * cartItems[i].quantity).toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ClipOval(
                            child: Material(
                              color: Colors.blue, // Button color
                              child: InkWell(
                                onTap: () {
                                  cart.decrementQuantity(
                                      cartItemsKeys[i], context);
                                },
                                child: const SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            cartItems[i].quantity.toString(),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          ClipOval(
                            child: Material(
                              color: Colors.blue, // Button color
                              child: InkWell(
                                onTap: () {
                                  cart.incrementQuantity(cartItemsKeys[i]);
                                },
                                child: const SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
