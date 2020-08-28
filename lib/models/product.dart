import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String discription;
  final double price;
  final int quantity;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  // {} = Using named parameters
  // @required = To indicate required fields
  Product({this.id,
    @required this.name,
    this.discription,
    @required this.price,
    this.quantity,
    this.imageUrl,
    @required this.createdAt,
    this.updatedAt});
}
