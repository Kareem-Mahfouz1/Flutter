import 'package:flutter/material.dart';
import 'package:qwik_buy/core/utils/styles.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: Styles.textStyle14,
        ),
      ),
    );
  }
}
