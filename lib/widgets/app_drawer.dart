import 'package:flutter/material.dart';
import 'package:shop_provider_demo/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("Hello"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop_2),
            title: const Text("Shop"),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment_rounded),
            title: const Text("Orders"),
            onTap: (){
              Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
