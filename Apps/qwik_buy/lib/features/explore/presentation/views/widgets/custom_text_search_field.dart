import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextSearchField extends StatelessWidget {
  const CustomTextSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(230, 245, 245, 245),
            filled: true,
            prefixIcon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
