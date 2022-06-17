import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/shop_app_drawer.dart';

import '../providers/cart.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions { Favourites, All }

class productOverViewScreen extends StatefulWidget {
  productOverViewScreen({Key? key}) : super(key: key);

  @override
  State<productOverViewScreen> createState() => _productOverViewScreenState();
}

class _productOverViewScreenState extends State<productOverViewScreen> {
  var _showFavouritesOnly = false;
  var isInit = true;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context).fetchProducts().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;
  }

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
                  value: FilterOptions.Favourites,
                  child: Text('Only favourites')),
              const PopupMenuItem(
                  value: FilterOptions.All, child: Text('Show all')),
            ],
          ),
          Consumer<Cart>(
            builder: (ctx, cartData, _) => Badge(
              value: cartData.itemCount.toString(),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
            ),
          )
        ],
      ),
      drawer: const ShopAppDrawer(),
      body: isLoading? const Center(
        child: CircularProgressIndicator(),
      ): ProductGrid(_showFavouritesOnly),
    );
  }
}
