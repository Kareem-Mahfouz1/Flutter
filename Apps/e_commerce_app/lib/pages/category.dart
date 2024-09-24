// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/data/network/store_api.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/pages/product_details.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String category;
  const Category({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
        centerTitle: true,
        title: Text(category, style: Consts.txt1.copyWith(fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Product>>(
          future: StoreApi.getProductsByCategory(category),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            }
            if (snapshot.hasData) {
              var products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(product: product),
                          ));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Consts.grey,
                          borderRadius: BorderRadius.circular(Consts.rad)),
                      child: Row(
                        children: [
                          Image.network(
                            product.image,
                            width: 100,
                          ),
                          SizedBox(width: 25),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  products[index].title,
                                  style: Consts.txt1.copyWith(fontSize: 18),
                                  softWrap: true,
                                ),
                                Divider(
                                  thickness: 5,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Rating: ${product.rating.rate}',
                                  style: Consts.txt1.copyWith(fontSize: 22),
                                ),
                                Text(
                                  'Price: ${product.price} \$',
                                  style: Consts.txt1.copyWith(fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
