import 'package:flutter/material.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/movies_body.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/series_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const MoviesBody(),
        const SeriesBody(),
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() => selectedIndex = value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.local_movies_rounded),
            label: 'Movies',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv_rounded),
            label: 'Series',
          ),
        ],
      ),
    );
  }
}
