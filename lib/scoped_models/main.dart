import 'package:scoped_model/scoped_model.dart';
import 'auth.dart';
import 'products.dart';

// This merges the methods and properties from all the added classes into one class
class MainModel extends Model with ProductsModel, AuthModel {
}
