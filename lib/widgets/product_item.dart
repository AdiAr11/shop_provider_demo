import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shop_provider_demo/providers/cart.dart';
import 'package:shop_provider_demo/providers/product.dart';
import 'package:shop_provider_demo/screens/product_detail_screen.dart';

//How one product in a grid should look like
class ProductItem extends StatefulWidget {
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
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
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
                heroTag: "btn${product.id}",
                  backgroundColor: Colors.white,
                  onPressed: () {
                    product.changeIsFavourite();
                  },
                  child: Icon(
                    Icons.favorite,
                    color: !product.isFavourite
                        ? Colors.grey.shade400
                        : Colors.red,
                  ))),
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
            onPressed: () {
              cart.addItem(
                  product.id, product.title, product.price, product.imageUrl);
              _showToast();
            },
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

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Item added to cart"),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
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
