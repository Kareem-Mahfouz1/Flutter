import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  final String imagePath;
  const Second({super.key, required this.imagePath});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Second !'),
        centerTitle: true,
      ),
      body: Center(
        heightFactor: 1.1,
        child: Hero(tag: 'flutter', child: Image.asset(widget.imagePath)),
      ),
    );
  }
}
