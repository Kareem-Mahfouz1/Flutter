import 'package:flutter/material.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/add_goal_body.dart';

class AddGoalView extends StatelessWidget {
  const AddGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddGoalBody(),
    );
  }
}
