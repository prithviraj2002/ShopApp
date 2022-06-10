import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/cart_item.dart';

import '../providers/cart.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(15),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        '\$${cartData.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple,
                      elevation: 5,
                    ),
                    FlatButton(
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false).addOrder(
                            cartData.items.values.toList(),
                            cartData.totalAmount,
                          );
                          cartData.clearCart();
                        },
                        child: const Text(
                          'ORDER NOW!',
                          style: TextStyle(color: Colors.purple, fontSize: 17),
                        ))
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: ((context, index) => CartProduct(
                cartData.items.values.toList()[index].id,
                cartData.items.keys.toList()[index],
                cartData.items.values.toList()[index].price,
                cartData.items.values.toList()[index].quantity,
                cartData.items.values.toList()[index].title)),
            itemCount: cartData.itemCount,
          ))
        ],
      ),
    );
  }
}
