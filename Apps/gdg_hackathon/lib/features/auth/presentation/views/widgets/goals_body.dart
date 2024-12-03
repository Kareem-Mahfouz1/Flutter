import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/goals_item.dart';

class GoalsBody extends StatelessWidget {
  const GoalsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My goals',
                  style: Styles.textStyle20,
                )
              ],
            ),
            const SizedBox(height: 32),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: const [
                GoalsItem(perc: 20, title: 'Vacation', duration: 1),
                GoalsItem(perc: 29, title: 'Education', duration: 5),
                GoalsItem(perc: 78, title: 'Laptop', duration: 2),
                GoalsItem(perc: 25, title: 'Cloths', duration: 1),
                GoalsItem(perc: 9, title: 'Food', duration: 3),
              ],
            )
          ],
        ),
      ),
    );
  }
}
