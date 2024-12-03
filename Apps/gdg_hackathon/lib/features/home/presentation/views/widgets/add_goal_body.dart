import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/functions/input_validation.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_text_field.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/add_goal_appbar.dart';
import 'package:go_router/go_router.dart';

class AddGoalBody extends StatelessWidget {
  const AddGoalBody({super.key});
  static final TextEditingController goalName = TextEditingController();
  static final TextEditingController amount = TextEditingController();
  static final TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const AddGoalAppbar(),
            const SizedBox(height: 40),
            CustomTextField(
              label: 'Goal Name',
              controller: goalName,
              validator: validateBalance,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: 'Amount',
              controller: amount,
              validator: validateBalance,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: 'Date',
              controller: date,
              validator: validateBalance,
            ),
            const SizedBox(height: 15),
            const SizedBox(height: 400),
            SizedBox(
              height: 57,
              width: double.infinity,
              child: CustomButton(
                text: 'Save',
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
