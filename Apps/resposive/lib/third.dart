import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3500), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 300),
          duration: const Duration(milliseconds: 3000),
          builder: (context, value, child) {
            return SizedBox(
              height: value,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 8 * math.pi),
                duration: const Duration(milliseconds: 3000),
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: value,
                    child: Image.asset('images/flutter.png'),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
