import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_provider_demo/providers/orders.dart';

class AnOrder extends StatefulWidget {

  final OrderItem order;

  const AnOrder({Key? key, required this.order}) : super(key: key);

  @override
  State<AnOrder> createState() => _AnOrderState();
}

class _AnOrderState extends State<AnOrder> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount}"),
            subtitle: Text(
              DateFormat("dd/MM/yyyy   hh:mm").format(widget.order.dateTime)
            ),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less_rounded : Icons.expand_more_rounded),
              onPressed: () {
                setState((){
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if(_isExpanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 50, 180),
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children:
                widget.order.products.map((product) =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '${product.quantity} x \$${product.price}',
                        style: const TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  )
                ).toList(),
              ),
            )
        ],
      ),
    );
  }
}
