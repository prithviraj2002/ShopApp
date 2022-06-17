import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/editable_product_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String itemTitle;
  final String imageUrl;
  final String productId;

  const UserProductItem(
      {required this.itemTitle,
      required this.imageUrl,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemTitle),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                  Provider.of<EditableProduct>(context, listen: false).addId(productId);
                },
                icon: const Icon(Icons.edit),
                color: Colors.purple),
            IconButton(
                onPressed: () {
                  Provider.of<Products>(context, listen: false)
                      .deleteProduct(productId);
                },
                icon: const Icon(
                  Icons.delete,
                ),
                color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
