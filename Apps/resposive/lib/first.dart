import 'dart:async';

import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  Tween<double> tween = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: TweenAnimationBuilder(
            curve: Curves.easeInOutQuart,
            tween: tween,
            duration: const Duration(milliseconds: 2800),
            child: Image.asset(
              'images/flutter.png',
              width: MediaQuery.of(context).size.width * .5,
            ),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: child,
              );
            },
          ),
        ));
  }
}
