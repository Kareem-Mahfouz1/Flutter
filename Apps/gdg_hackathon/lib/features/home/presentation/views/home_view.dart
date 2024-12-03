import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/models/user.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/goals_body.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/home_body.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.user});
  final User user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: selectedIndex == 2
          ? FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kAddGoalView);
              },
              child: const Icon(
                Icons.add,
                color: Colors.grey,
              ),
            )
          : null,
      body: SafeArea(
          child: [
        HomeBody(user: widget.user),
        HomeBody(user: widget.user),
        const GoalsBody(),
        HomeBody(user: widget.user),
      ][selectedIndex]),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        backgroundColor: kSecondaryColor,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home_filled,
              color: kPrimaryColor,
            ),
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.database),
            label: 'Budget',
            selectedIcon: Icon(
              FontAwesomeIcons.database,
              color: kPrimaryColor,
            ),
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.penToSquare),
            label: 'Goals',
            selectedIcon: Icon(
              FontAwesomeIcons.penToSquare,
              color: kPrimaryColor,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
            selectedIcon: Icon(
              Icons.person_sharp,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
