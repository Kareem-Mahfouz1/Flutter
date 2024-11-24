import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CustomInfoContainer extends StatelessWidget {
  const CustomInfoContainer(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.textStyle14,
          ),
          Text(
            value,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
