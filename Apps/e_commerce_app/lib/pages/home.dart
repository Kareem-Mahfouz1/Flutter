// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/data/network/store_api.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/pages/category.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final User user;
  static const images = [
    "electronics.png",
    "jewelery.png",
    "men.png",
    "women.png",
  ];
  const Home({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Consts.grey,
                  borderRadius: BorderRadius.circular(Consts.rad)),
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hi,${user.name.firstname}!',
                        style: Consts.txt1.copyWith(fontSize: 30),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Check out the new collection!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    'Categories',
                    style: Consts.txt1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: StoreApi.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error.toString()}'),
                  );
                }
                if (snapshot.hasData) {
                  List<String> categories = snapshot.data as List<String>;
                  return Expanded(
                    child: GridView.builder(
                      itemCount: categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .85,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Category(
                                    category: categories[index],
                                  ),
                                ));
                          },
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: Consts.grey,
                                borderRadius:
                                    BorderRadius.circular(Consts.rad)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "images/${images[index]}",
                                  height: 90,
                                ),
                                Text(
                                  categories[index],
                                  style: Consts.txt1.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
