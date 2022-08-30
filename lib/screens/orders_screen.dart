import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider_demo/providers/orders.dart';
import 'package:shop_provider_demo/widgets/app_drawer.dart';
import 'package:shop_provider_demo/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders_screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final orders = Provider.of<Orders>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, i){
            return AnOrder(order: orders[i]);
          }
      ),
    );
  }
}
