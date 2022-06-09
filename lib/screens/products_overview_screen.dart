import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';

class productOverViewScreen extends StatelessWidget {

  productOverViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ProductGrid(),
    );
  }
}
