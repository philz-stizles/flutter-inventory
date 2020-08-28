import 'package:flutter/material.dart';
import 'package:inventory/models/product.dart';
import 'package:inventory/scoped_models/main.dart';
import 'package:inventory/utils/palette.dart';
import 'package:inventory/utils/size_config.dart';
import 'package:inventory/widgets/inputs.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCreate extends StatefulWidget {
  @override
  _ProductCreateState createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final Map<String, dynamic> _newProduct = {
    "name": "",
    "description": "",
    "price": 0.0,
    "quantity": 0,
    "shipping": false
  };

  _onChange(name, value) {
    _newProduct[name] = value;
  }

  _addProduct(BuildContext cxt, MainModel model) async {
    Map<String, dynamic> response = await model.createProduct(_newProduct);
    final parentContext = Scaffold.of(cxt);
    return (!response["isSuccess"])
        ? null
        : parentContext.showSnackBar(_buildSnackBar(
            response['message'],
            Palette.lightGreen,
            Palette.green,
            () => parentContext.hideCurrentSnackBar()));
    ;
  }

  Widget _buildSnackBar(message, actionColor, bgColor, onPressed) {
    return SnackBar(
        content: Text(message),
        backgroundColor: bgColor,
        duration: Duration(minutes: 1),
        action: SnackBarAction(
            label: 'Ok', textColor: actionColor, onPressed: onPressed));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) => _onChange("name", value),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                onChanged: (value) => _onChange("price", value),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Quantity'),
                onChanged: (value) => _onChange("quantity", value),
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) => _onChange("description", value),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                title: Text('Shipping'),
                value: _newProduct["shipping"],
                onChanged: (value) {
                  setState(() {
                    _newProduct["shipping"] = value;
                  });
                },
              ),
              ImageField(),
              SizedBox(
                height: getProportionateScreenHeight(50.0),
              ),
              ScopedModelDescendant<MainModel>(
                builder: (context, child, model) {
                  return RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      textColor: Palette.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create',
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.add)
                        ],
                      ),
                      onPressed: () {
                        _addProduct(context, model);
                      });
                },
              )
            ],
          ),
        ));
  }
}
