import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/product_detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final productData =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Hero(
                  tag: "heroTag$productId",
                  child: Image.network(
                    productData.imageUrl,
                    alignment: Alignment.center,
                    // fit: BoxFit.,
                  ),
                )),
            SizedBox(height: 10.0,),
            Text("\$${productData.price}", style: const TextStyle(
              color: Colors.grey,
              fontSize: 25.0
            ),),
            SizedBox(height: 10.0,),
            Text(
              productData.description,
              style: TextStyle(
                fontSize: 20.0
              ),
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
