import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItems {
  final String id;
  final List<CartItem> products;
  final double amount;
  final DateTime dateTime;

  OrderItems({
    required this.id,
    required this.products,
    required this.amount,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItems> _orders = [];

  List<OrderItems> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItems(
            id: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
