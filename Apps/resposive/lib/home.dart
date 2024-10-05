import 'package:flutter/material.dart';
import 'package:resposive/first.dart';
import 'package:resposive/second.dart';
import 'package:resposive/third.dart';

class Home extends StatelessWidget {
  final String image = 'images/flutter.png';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Animations!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const First(),
                  )),
              child: const Text('First Animation'),
            ),
            ListTile(
              title: Hero(
                  tag: 'flutter',
                  child: Image.asset(
                    image,
                    height: 100,
                  )),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Second(imagePath: image),
                  )),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Third(),
                  )),
              child: const Text('Third Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
