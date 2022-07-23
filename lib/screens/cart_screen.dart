import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chat_screen";

  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);

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
                  Chip(label: Text('\$ ${cart.totalPrice()}')),
                  TextButton(onPressed: (){}, child: const Text("Order Now"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
