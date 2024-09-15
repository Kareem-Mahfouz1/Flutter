import 'dart:convert';
import 'package:flutter_application_1/recipe.dart';
import 'package:http/http.dart';

class API {
  static const _apiKey = '';
  static const _baseUrl = 'https://api.spoonacular.com';

  static Future getRecipeDetails(int id) async {
    final String url =
        '$_baseUrl/recipes/$id/information?includeNutrition=false&addWinePairing=false&apiKey=$_apiKey';
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error1: ${response.statusCode}');
    }
  }

  static Future<List<Recipe>> getRandomRecipes(int number) async {
    final String url =
        '$_baseUrl/recipes/random?number=$number&apiKey=$_apiKey';
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Recipe> recipes = [];
      List res = json.decode(response.body)['recipes'];
      for (var element in res) {
        recipes.add(Recipe.initial(element));
      }
      return recipes;
    } else {
      throw Exception('Error2: ${response.statusCode}');
    }
  }
}
