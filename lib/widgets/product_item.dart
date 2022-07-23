import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider_demo/providers/product.dart';
import 'package:shop_provider_demo/screens/product_detail_screen.dart';

//How one product in a grid should look like
class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final double price;
  // final String imageUrl;
  // const ProductItem(
  //     {Key? key,
  //     required this.imageUrl,
  //     required this.id,
  //     required this.title,
  //     required this.price})
  //     : super(key: key);
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    //using Provider.of rebuilds the whole widget. If we just want a part of ui
    // to be rebuilt, we can wrap it around Consumer widget, otherwise same
    //Consumer widget always listens to changes

    return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: GridTile(
            header: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      product.changeIsFavourite();
                    },
                    child: Icon(Icons.favorite, color: !product.isFavourite ?
                    Colors.grey.shade400 : Colors.red,)
                )
              ),
            ),
            footer: GridTileBar(
              title: Text(
                "${product.title}\n"
                    "₹ ${product.price}",
                // textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black54,
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                // color: Theme.of(context).colorScheme.secondary,
                color: Colors.greenAccent,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductDetailScreen.routeName,
                    arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }
}

// Row(
// // crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// SizedBox(
// // height: 100.0,
// width: 120,
// child: Image.network(
// imageUrl,
// fit: BoxFit.contain,
// )),
// const SizedBox(
// width: 5.0,
// ),
// Column(
// children: [
// Text(
// title,
// style:
// const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
// ),
// Text(
// "₹ $price",
// style: const TextStyle(
// fontSize: 20.0,
// fontWeight: FontWeight.w600,
// color: Colors.green),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// IconButton(
// onPressed: () {},
// icon: const Icon(Icons.shopping_cart),
// color: Theme.of(context).colorScheme.secondary,
// ),
// IconButton(
// onPressed: () {},
// icon: const Icon(Icons.favorite),
// color: Theme.of(context).colorScheme.secondary,
// ),
// ],
// )
// ],
// )
// ],
// );
