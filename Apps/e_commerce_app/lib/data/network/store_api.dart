import 'dart:convert';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/data/models/user.dart';
import 'package:http/http.dart' as http;

class StoreApi {
  static const String _baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> getProductsByCategory(String category) async {
    final String url = '$_baseUrl/products/category/$category';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      List<Product> products = [];
      json
          .decode(response.body)
          .forEach((e) => products.add(Product.fromMap(e)));
      return products;
    } else {
      throw ('Error: ${response.statusCode}');
    }
  }

  static Future<List> getCategories() async {
    const String url = '$_baseUrl/products/categories';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      List<String> list = [];
      json.decode(response.body).forEach((e) => list.add(e));
      return list;
    } else {
      throw ('Error: ${response.statusCode}');
    }
  }

  static Future<User> logUserin(String username, String password) async {
    const String url = '$_baseUrl/auth/login';
    http.Response response = await http.post(
      Uri.parse(url),
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      User user = await getUserByUsername(username);
      return user;
    } else {
      throw ('Error: ${response.statusCode}');
    }
  }

  static Future<User> getUserByUsername(String username) async {
    const String url = '$_baseUrl/users';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      for (var element in (json.decode(response.body) as List)) {
        User tmpUser = User.fromMap(element);
        if (tmpUser.username == username) {
          return tmpUser;
        }
      }
      throw ('Error: Something fucked up happened here!!!!!');
    } else {
      throw ('Error: ${response.statusCode}');
    }
  }

  static Future registerUser(User user) async {
    const String url = '$_baseUrl/users';
    http.Response response = await http.post(
      Uri.parse(url),
      body: json.encode(user.toMap()),
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return json.decode(response.body);
    } else {
      throw ('Error: ${response.statusCode}');
    }
  }
}
