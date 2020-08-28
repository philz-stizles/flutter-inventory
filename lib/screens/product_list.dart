import 'package:flutter/material.dart';
import 'package:inventory/models/product.dart';
// import 'package:inventory/models/product.dart';
import 'package:inventory/scoped_models/main.dart';
import 'package:inventory/screens/product_detail.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductList extends StatelessWidget {
  // final List<Product> products;
  // ProductList({@required this.products});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model) {
        final List<Product> products = model.products;
        return Container(
            child: (products.length <= 0)
                ? Center(
                    child: Text('No products available'),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final currentProduct = products[index];
                      return ListTile(
                        leading: null,
                        title: Text(currentProduct.name),
                        subtitle: Text(currentProduct.price.toString()),
                        trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetail(product: currentProduct),
                                  ));
                            }),
                        onTap: () {},
                      );
                    },
                  ));
      },
    );
  }
}
