import 'package:flutter/material.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/categorey_view_body.dart';

class CategoreyView extends StatelessWidget {
  const CategoreyView({super.key, required this.categorey});
  final String categorey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CategoreyViewBody(categorey: categorey),
      ),
    );
  }
}
