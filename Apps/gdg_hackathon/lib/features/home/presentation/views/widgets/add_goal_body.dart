import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/functions/input_validation.dart';
import 'package:gdg_hackathon/core/models/goal.dart';
import 'package:gdg_hackathon/core/models/user.dart';
import 'package:gdg_hackathon/core/utils/assets.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_text_field.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/add_goal_appbar.dart';
import 'package:go_router/go_router.dart';

class AddGoalBody extends StatelessWidget {
  const AddGoalBody({super.key, required this.user});
  static final TextEditingController goalName = TextEditingController();
  static final TextEditingController amount = TextEditingController();
  static final TextEditingController date = TextEditingController();
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 40),
          child: IntrinsicHeight(
            child: Column(
              children: [
                const SizedBox(height: 12),
                const AddGoalAppbar(),
                Image.asset(MyAssets.addGoalImg),
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
                const Spacer(),
                SizedBox(
                  height: 57,
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Save',
                    onPressed: () {
                      Goal goal = Goal.fromJson({
                        'goalName': goalName.text,
                        'targetAmount': int.parse(amount.text),
                        'savedAmount': user.balance,
                        'deadline': date.text
                      });
                      GoRouter.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
