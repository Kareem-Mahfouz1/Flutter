import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qwik_buy/core/utils/app_router.dart';
import 'package:qwik_buy/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    initAnimation();
    navigateToLogin();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          MyAssets.logo,
          height: 150,
        ),
        FadeTransition(
          opacity: fadeAnimation,
          child: Image.asset(
            MyAssets.name,
            scale: 1.7,
          ),
        ),
      ],
    );
  }

  void initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    controller.forward();
  }

  Future<void> navigateToLogin() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        if (mounted) {
          context.go(AppRouter.kLoginView);
        }
      },
    );
  }
}
