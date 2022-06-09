import 'package:flutter/material.dart';

class productItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const productItem(this.id, this.title, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imageUrl),
    );
  }
}
