import '../../constants.dart';
import '../utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Center(
        child: Text(
          errMessage,
          style: Styles.gentiumBookPlus20,
        ),
      ),
    );
  }
}
