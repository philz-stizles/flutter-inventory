import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory/models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Create a class to interact with and manage products
mixin ProductsModel on Model {
  String _baseUrl = 'https://brb-fizzy.herokuapp.com/api/v1';
  List<Product> _products = [];
  
  bool _productIsLoading = false;
  bool _editProductIsLoading = false;

  List<Product> get products {
    return List.from(_products); // Ensure to return a new List and not a
    // reference
  }

  bool get productIsLoading {
    return _productIsLoading;
  }

  bool get editProductIsLoading {
    return _editProductIsLoading;
  }

  Future<bool> fetchProducts() async {
    _productIsLoading = true;
    SharedPreferences store = await SharedPreferences.getInstance();
    String token = store.getString('token');
    if (token == null) {
      _productIsLoading = false;
      notifyListeners();
      return false;
    }

    final http.Response response = await http.get(_baseUrl,
        headers: {'Content-Type': 'application/json', 'x-access-token': token});

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    bool hasError = true;
    switch (response.statusCode) {
      case 200:
        if (responseData['products'] != null) {
          final List<Product> fetchedProducts = [];
          responseData['products'].forEach((p) {
            final Product product = Product(
                id: p['id'],
                name: p['name'],
                price: p['price'],
                createdAt: DateTime.parse(p['createdAt']),
                updatedAt: DateTime.parse(p['updatedAt']));
            fetchedProducts.add(product);
          });

          _products = fetchedProducts;
          hasError = false;
        }

        break;
      default:
        hasError = true;
        break;
    }

    _productIsLoading = false;
    notifyListeners();
    return !hasError;
  }

  Future<Map<String, dynamic>> createProduct(
      Map<String, dynamic> product) async {
    // Start loader/spinner as async request has started
    _editProductIsLoading = true;
    notifyListeners();
    print(product);

    // Retrieve token from storage
    SharedPreferences store = await SharedPreferences.getInstance();
    var token = store.getString('token');
    if (token == null) {}

    final String url = _baseUrl + '/products';
    final http.Response response = await http.post(url,
        body: json.encode(product),
        headers: {'Content-Type': 'application/json', 'x-access-token': token});

    // Stop loader/spinner as response is returned
    _editProductIsLoading = false;
    notifyListeners();

    // Decode http reponse
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);

    String message;
    bool hasError = true;
    switch (response.statusCode) {
      case 200:
      case 201:
        if (responseData['product'] != null) {
          // final product = responseData['product'];
          // _products.removeLast();
          // _products.insert(
          //     0,
          //     Product(
          //         id: product['id'],
          //         name: product['name'],
          //         price: product['price'],
          //         createdAt: DateTime.parse(product['createdAt']),
          //         updatedAt: DateTime.parse(product['updatedAt'])));
          hasError = false;
          message = responseData['message'];
        }

        break;

      case 422:
        hasError = true;
        message = 'Bad request';
        break;

      case 403:
        hasError = true;
        message = 'Unauthorized';
        break;

      default:
        hasError = true;
        message = 'An error occurred, please check the data, and try again';
        break;
    }

    _editProductIsLoading = false;
    notifyListeners();

    return {'isSuccess': !hasError, 'message': message};
  }

  Future<Map<String, dynamic>> updateProduct(
      String id, Map<String, dynamic> product) async {
    // Start loader/spinner as async request has started
    _editProductIsLoading = true;
    notifyListeners();
    print(product);
    // Retrieve token from storage
    SharedPreferences store = await SharedPreferences.getInstance();
    var token = store.getString('token');
    if (token == null) {}
    print(token);

    final String url = _baseUrl + '/products/' + id;
    final http.Response response = await http.put(url,
        body: json.encode(product),
        headers: {'Content-Type': 'application/json', 'x-access-token': token});

    // Stop loader/spinner as response is returned
    _editProductIsLoading = false;
    notifyListeners();

    // Decode http reponse
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    String message;
    bool hasError = true;
    switch (response.statusCode) {
      case 200:
        if (responseData['message'] != null) {
          int targetIndex = _products.indexWhere((p) {
            return p.id == id;
          });

          _products[targetIndex] = new Product(
              id: id,
              name: product['name'],
              price: double.parse(product['price']));
          hasError = false;
          message = responseData['message'];
        }

        break;

      case 422:
        hasError = true;
        message = 'Updated unsuccessful, check data input and try again';
        break;

      case 403:
        hasError = true;
        message = 'Update unsuccessful, unauthorized access';
        break;

      default:
        hasError = true;
        message = 'Update unsuccessful, check iput data and try again';
        break;
    }

    _editProductIsLoading = false;
    notifyListeners();

    return {'isSuccess': !hasError, 'message': message};
  }
}
