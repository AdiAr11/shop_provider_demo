import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum FilterProductsOptions { favourites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  bool _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterProductsOptions.favourites,
                child: Text("Favourites Only"),
              ),
              const PopupMenuItem(
                value: FilterProductsOptions.all,
                child: Text("Show All"),
              ),
            ],
            onSelected: (FilterProductsOptions selected) {
              if(selected == FilterProductsOptions.favourites){
                _showOnlyFavourites = true;
              }else{
                _showOnlyFavourites = false;
              }
              setState((){});
            },
          )
        ],
      ),
      body: SafeArea(
        child: ProductsGrid(showOnlyFavourites: _showOnlyFavourites,),
      ),
    );
  }
}
