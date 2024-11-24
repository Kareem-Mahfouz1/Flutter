import 'package:flutter/material.dart';
import '../../data/models/categories/child.dart';
import 'widgets/categorey_view_body.dart';

class CategoreyView extends StatelessWidget {
  const CategoreyView({super.key, required this.brand});
  final Child brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CategoreyViewBody(brand: brand),
      ),
    );
  }
}
