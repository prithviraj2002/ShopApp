import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

import '../providers/product.dart';
import '../widgets/product_grid.dart';

enum FilterOptions { Favourites, All }

class productOverViewScreen extends StatefulWidget {
  productOverViewScreen({Key? key}) : super(key: key);

  @override
  State<productOverViewScreen> createState() => _productOverViewScreenState();
}

class _productOverViewScreenState extends State<productOverViewScreen> {
  var _showFavouritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() { 
                if (selectedValue == FilterOptions.Favourites) {
                _showFavouritesOnly = true;
              } else {
                _showFavouritesOnly = false;
              }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                  child: Text('Only favourites'),
                  value: FilterOptions.Favourites),
              const PopupMenuItem(
                  child: Text('Show all'), value: FilterOptions.All),
            ],
          )
        ],
      ),
      body: ProductGrid(_showFavouritesOnly),
    );
  }
}
