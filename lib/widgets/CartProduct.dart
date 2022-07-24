import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider_demo/providers/cart.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context).cartItem;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Row(
        children: [
          SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                  "https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg")),
          const Text(
            "Yellow Scarf \n\$32",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          SizedBox(
            width: 30.0,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.blue,
              onPressed: () {},
              child: const Icon(Icons.remove),
            ),
          ),
          Text("  1  ", style: TextStyle(fontSize: 18.0),),
          SizedBox(
            width: 30.0,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.blue,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
