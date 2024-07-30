// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return Impl();
  }
}

class Impl extends State<App> {
  var ctr = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          'https://thumbs.dreamstime.com/z/collection-take-away-foil-boxes-healthy-food-set-containers-meals-top-view-free-copy-space-164637874.jpg',
                    ),
                  )
                ],
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
                style: TextStyle(fontSize: 21),
              ),
              Container(
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/meal.png'),
                    Image.asset('assets/images/food.png')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
