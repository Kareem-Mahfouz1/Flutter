// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Consts.grey,
                    borderRadius: BorderRadius.circular(Consts.rad)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Consts.txt1.copyWith(fontSize: 18),
                    ),
                    Text(
                      'Rating: ${product.rating.rate}(${product.rating.count})',
                      style: Consts.txt1
                          .copyWith(fontSize: 16, color: Colors.grey[800]),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Image.network(
                    product.image,
                    height: 350,
                  ),
                ),
              ),
              Divider(
                thickness: 6,
                height: 20,
              ),
              Text(
                '${product.price} \$',
                style: Consts.txt1
                    .copyWith(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              Text(
                'All prices include VAT.',
                style:
                    Consts.txt1.copyWith(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 25),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Colors.white,
                      foregroundColor: Consts.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Consts.rad))),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                thickness: 6,
                height: 30,
              ),
              Text(
                'Product details',
                style: Consts.txt1,
              ),
              Text(
                '\n${product.description}',
                style: Consts.txt1.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
