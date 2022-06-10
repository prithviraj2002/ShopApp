import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/shop_app_drawer.dart';

import '../providers/orders.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders-screen';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body:  ListView.builder(
              itemBuilder: ((context, index) =>
                  OrderItemTile(orderData.orders[index])),
              itemCount: orderData.orders.length,
            ),
          drawer: const ShopAppDrawer(),
      );
  }
}
