// Create a class to interact with and manage products
import 'package:scoped_model/scoped_model.dart';

mixin AuthModel on Model {
//   String _baseUrl = 'https://brb-fizzy.herokuapp.com/api';
//   bool _authIsLoading = false;
//   User _authenticatedUser;
//   PublishSubject<bool> _userSubject = PublishSubject();

//   bool get authIsLoading {
//     return _authIsLoading;
//   }

//   User get user {
//     return _authenticatedUser;
//   }

//   PublishSubject<bool> get userSubject {
//     return _userSubject;
//   }

//   Future<Map<String, dynamic>> signup(Map<String, dynamic> signupData) async {
//     // Start loader/spinner
//     _authIsLoading = true;
//     notifyListeners();

//     // Send Signin request
//     final http.Response response = await http.post(_baseUrl + '/auth/v1/signup',
//         body: json.encode(signupData),
//         headers: {'Content-Type': 'application/json'});

//     // Decode response
//     final Map<String, dynamic> responseData = json.decode(response.body);
//     print(responseData);

//     // Initialize response values
//     bool hasError = true;
//     String message = 'An error occured, please try again later';

//     switch (response.statusCode) {
//       case 201:
//       case 200:
//         // Use bracket notation here because with dot notation, dart might be
//         // looking for an existing model with the exisitng property
//         if (responseData.containsKey('user')) {
//           if (responseData['user'] != null) {
//             if (responseData['user']['accessToken'] != null) {
//               // Set Error to false
//               hasError = false;
//               message = responseData['message'];

//               // Store User credentials in memory
//               _authenticatedUser = new User(
//                 firstname: responseData['user']['firstName'],
//                 lastname: responseData['user']['lastName'],
//                 email: responseData['user']['email'],
//                 phone: responseData['user']['phone'],
//                 address: responseData['user']['address'],
//                 role: responseData['user']['role'],
//               );

//               // Emit user authentication status event
//               _userSubject.add(true);

//               // Store User credentials in native storage
//               SharedPreferences store = await SharedPreferences.getInstance();
//               store.setString('token', responseData['user']['accessToken']);
//               store.setString('user', json.encode(responseData['user']));
//             }
//           }
//         }
//         break;

//       case 400:
//         message = responseData['message'];
//         break;

//       default:
//         message = 'Please check the information, and try again';
//         break;
//     }

//     _authIsLoading = false;
//     notifyListeners();
//     return {'isSuccess': !hasError, 'msg': message};
//   }

//   Future<Map<String, dynamic>> signin(Map<String, dynamic> signinData) async {
//     // Start loader/spinner
//     _authIsLoading = true;
//     notifyListeners();

//     // Send Signin request
//     final http.Response response = await http.post(_baseUrl + '/auth/v1/signin',
//         body: json.encode(signinData),
//         headers: {'Content-Type': 'application/json'});

//     // Decode response
//     final Map<String, dynamic> responseData = json.decode(response.body);
//     print(responseData);

//     // Initialize response values
//     bool hasError = true;
//     String message = 'An error occured, please try again later';

//     switch (response.statusCode) {
//       case 200:
//         // Set Error to false
//         hasError = false;

//         // Store data in native storage
//         SharedPreferences store = await SharedPreferences.getInstance();
//         // Use bracket notation here because with dot notation, dart might be
//         // looking for an existing model with the exisitng property
//         if (responseData['user'] != null) {
//           print(json.encode(responseData['user']));
//           if (responseData['user']['accessToken'] != null) {
//             // Store User credentials in memory
//             _authenticatedUser = new User(
//               firstname: responseData['user']['firstName'],
//               email: responseData['user']['email'],
//               address: responseData['user']['address'],
//               role: responseData['user']['role'],
//             );

//             // Emit user authentication status event
//             _userSubject.add(true);

//             // Store User credentials in store
//             store.setString('token', responseData['user']['accessToken']);
//             store.setString('user', json.encode(responseData['user']));
//           }
//         }
//         break;
//       case 401:
//         message = responseData['message'];
//         break;

//       case 404:
//         message = responseData['message'];
//         break;

//       case 422:
//         message = 'Please check the information, and try again';
//         break;

//       default:
//         break;
//     }

//     _authIsLoading = false;
//     notifyListeners();
//     return {'isSuccess': !hasError, 'message': message};
//   }

//   void logOut() async {
//     // Clear authenticated user
//     _authenticatedUser = null;

//     // Clear authentication Timer
//     //_authTimer.cancel();

//     // Emit user authentication status event
//     _userSubject.add(false);

//     // Clear data in native storage
//     SharedPreferences store = await SharedPreferences.getInstance();
//     store.remove('token');
//     store.remove('user');
//   }

//   void storeAuthTimeout(SharedPreferences store, int expirySeconds) async {
//     // Calculate actual time of expiry and store calculated time
//     final DateTime now = DateTime.now();
//     final DateTime expiryDateTime = now.add(Duration(seconds: expirySeconds));
//     store.setString('expiryTime', expiryDateTime.toIso8601String());
//   }

//   void setAuthTimeout(int expirySeconds) {
//     // Set duration and action to take when duration expires
//     // _authTimer = Timer(Duration(seconds: expirySeconds), logOut);
//   }

//   void autoAuthenticate() async {
//     final SharedPreferences store = await SharedPreferences.getInstance();
//     final String token = store.getString('token');
//     print(token);

//     if (token != null) {
//       final String encodedUser = store.getString('user');
//       if (encodedUser != null) {
//         print(encodedUser);
//         final Map<String, dynamic> existingUser = json.decode(encodedUser);
//         _authenticatedUser = new User(
//             firstname: existingUser['firstName'],
//             email: existingUser['email'],
//             address: existingUser['address'],
//             role: existingUser['role'],
//             token: token);
//         _userSubject.add(true);
//         notifyListeners();
//       }
//     } else {
//       _authenticatedUser = null;
//       notifyListeners();
//     }

//     return;
//   }
}
