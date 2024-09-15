// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/recipe_details.dart';
import 'package:flutter_application_1/recipe.dart';

class Consts {
  static const myClr = Colors.green;
  static const txt1 = TextStyle(
    color: Consts.myClr,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}

class MyListing extends StatelessWidget {
  final String item;
  const MyListing({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: 6),
            Icon(
              Icons.circle_rounded,
              size: 12,
              color: Colors.green,
            ),
          ],
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            item,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final int time;
  final int count;
  const MyContainer({required this.time, required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            width: 2.5,
            color: Colors.grey[500]!,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: Consts.myClr,
                size: 27,
              ),
              Text('$time Mins'),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            children: [
              Text(
                count.toString(),
                style: TextStyle(color: Consts.myClr, fontSize: 20),
              ),
              Text('Ingredients'),
            ],
          )
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Recipe recipe;
  const MyCard({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetails(recipe: recipe),
                ));
          },
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Center(child: CircularProgressIndicator()),
                    Image.network(
                      recipe.image,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5), child: Text(recipe.title)))
            ],
          ),
        ),
      ),
    );
  }
}
