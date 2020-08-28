import 'package:flutter/material.dart';
import 'package:inventory/screens/product_detail.dart';
import 'package:inventory/utils/palette.dart';
import 'package:scoped_model/scoped_model.dart';

import 'routes.dart';
import 'scoped_models/main.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainModel _model = MainModel();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: _model,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Palette().primarySwatch,
            primaryColor: Palette.primary,
            buttonTheme: ButtonThemeData(
              buttonColor: Palette.primary,
              padding: EdgeInsets.symmetric(vertical: 10.0)
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Palette.primary,
              elevation: 10.0
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Roboto',
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Palette.textColor, fontSize: 16),
              bodyText2: TextStyle(color: Palette.textColor, fontSize: 16)
            ),
            scaffoldBackgroundColor: Colors.white,
            // textTheme: buildTextTheme(),
            // appBarTheme: buildAppBarTheme(),
          ),
          routes: {
            "product-detail": (BuildContext build) => ProductDetail(product: null),
            "product-edit": (BuildContext build) => ProductDetail(product: null)
          },
          home: Dashboard(),
        ));
  }
}
