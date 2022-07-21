import 'package:flutter/material.dart';
import 'package:shop_provider_demo/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: dummyProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2/3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0),
        //itemBuilder -> how every grid or cell is built
        itemBuilder: (context, i) =>
            ProductItem(
              id: dummyProducts[i].id,
              title: dummyProducts[i].title,
              imageUrl: dummyProducts[i].imageUrl,
              price: dummyProducts[i].price,
            )
    );
  }
}