import 'package:flutter/material.dart';
import 'package:qwik_buy/core/utils/assets.dart';
import 'package:qwik_buy/core/widgets/custom_back_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      leading: const Column(
        children: [
          SizedBox(height: 30),
          CustomBackButton(),
        ],
      ),
      expandedHeight: 450,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          MyAssets.testImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
