// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/local.dart';
import 'package:flutter_application_1/recipe.dart';
import 'package:flutter_application_1/resources.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetails({required this.recipe, super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  DbManager helper = DbManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black),
        foregroundColor: Consts.myClr,
        actions: [
          IconButton(
              onPressed: () async {
                String message = '';
                if (widget.recipe.isFavourited) {
                  await helper.deleteRecipe(widget.recipe.id);
                  widget.recipe.isFavourited = false;
                  message = 'removed from favourites';
                } else {
                  await helper.insertRecipe(widget.recipe);
                  widget.recipe.isFavourited = true;
                  message = 'added to favourites';
                }
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('this recipe has been $message')));
                });
              },
              icon: Icon(Icons.favorite_outline_rounded,
                  color: widget.recipe.isFavourited ? Colors.red : null)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share_rounded)),
        ],
      ),
      body: FutureBuilder(
        // future:null,
        future: widget.recipe.assignDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    widget.recipe.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.recipe.title,
                            style: Consts.txt1.copyWith(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: MyContainer(
                            count: widget.recipe.extendedIngredients.length,
                            time: widget.recipe.readyInMinutes,
                          ),
                        ),
                        Divider(
                          thickness: 2.5,
                          color: Colors.black45,
                        ),
                        Text(
                          'Ingredients:',
                          style: Consts.txt1.copyWith(fontSize: 26),
                        ),
                        Column(
                            children: widget.recipe.extendedIngredients
                                .map((e) => MyListing(item: e))
                                .toList()),
                        Divider(
                          thickness: 2.5,
                          color: Colors.black45,
                        ),
                        Text(
                          'Instructions:',
                          style: Consts.txt1.copyWith(fontSize: 26),
                        ),
                        Column(
                            children: widget.recipe.analyzedInstructions
                                .map((e) => MyListing(item: e))
                                .toList()),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
