import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../providers/products_provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final product = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => ChangeNotifierProvider (
        create: (ctx) => product[index],
        child: productItem(),
      ),
      itemCount: product.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
