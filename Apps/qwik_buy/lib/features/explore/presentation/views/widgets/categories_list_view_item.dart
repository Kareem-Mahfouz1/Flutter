import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
