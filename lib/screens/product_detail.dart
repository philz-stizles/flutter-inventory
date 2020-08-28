import 'package:flutter/material.dart';
import 'package:inventory/models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({@required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Image.asset(product.imageUrl),
        Container(child: Text('details'),)
      ],
    ),);
  }
}
