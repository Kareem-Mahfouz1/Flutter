import 'package:flutter/material.dart';
import '../../constants.dart';

UnderlineInputBorder enabledBorder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
}

UnderlineInputBorder focusedBorder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      color: kPrimaryColor,
      width: 2,
    ),
  );
}
