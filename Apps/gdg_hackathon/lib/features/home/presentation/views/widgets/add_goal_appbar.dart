import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/core/widgets/custom_back_button.dart';

class AddGoalAppbar extends StatelessWidget {
  const AddGoalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackButton(),
        Text(
          'Add Goal',
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
