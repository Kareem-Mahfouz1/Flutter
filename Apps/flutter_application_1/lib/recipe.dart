import 'package:flutter_application_1/helper/api.dart';
import 'package:flutter_application_1/helper/local.dart';

class Recipe {
  late int id;
  late String title;
  late String image;
  late int readyInMinutes;
  List<String> extendedIngredients = [];
  List<String> analyzedInstructions = [];
  bool isFavourited = false;

  Recipe.initial(Map<String, dynamic> json) {
    id = json[columnId];
    title = json[columnTitle];
    image = json[columnImage];
    if (json[columnIsFavourite] != null) {
      isFavourited = json[columnIsFavourite] == 1 ? true : false;
    }
  }


  assignDetails() async {
    final Map<String, dynamic> json = await API.getRecipeDetails(id);

    readyInMinutes = json['readyInMinutes'];

    for (var element in json['extendedIngredients']) {
      extendedIngredients.add(element['original']);
    }

    for (var section in json['analyzedInstructions']) {
      if (section['name'] != '') {
        analyzedInstructions.add('\nFor the ${section['name']}');
      }
      for (var instruction in section['steps']) {
        analyzedInstructions.add(instruction['step']);
      }
    }
    return 1;
  }

  toMap() => {
        columnId: id,
        columnTitle: title,
        columnImage: image,
        columnIsFavourite: isFavourited ? 1 : 0
      };
}
