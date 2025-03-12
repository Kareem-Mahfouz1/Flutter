import 'package:flutter/material.dart';
import 'package:imdb_top_100/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.error_outline_rounded,
          color: Colors.red,
        ),
        Text(
          errMessage,
          style: Styles.textStyle16,
        )
      ],
    );
  }
}
