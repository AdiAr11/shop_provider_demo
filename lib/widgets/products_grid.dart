import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider_demo/providers/products_provider.dart';
import 'package:shop_provider_demo/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);
    final productsList = productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: productsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2/3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0),
        //itemBuilder -> how every grid or cell is built
        itemBuilder: (context, i) => ChangeNotifierProvider(
            create: (context) => productsList[i],
            child: ProductItem(
              // id: productsList[i].id,
              // title: productsList[i].title,
              // imageUrl: productsList[i].imageUrl,
              // price: productsList[i].price,
            )
        ),

    );
  }
}