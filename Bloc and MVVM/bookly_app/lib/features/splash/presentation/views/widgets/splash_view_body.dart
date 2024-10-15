import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          MyAssets.logo,
          height: 50,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .03),
        SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Books Made Easy',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutCubic,
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
            .animate(curvedAnimation);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
