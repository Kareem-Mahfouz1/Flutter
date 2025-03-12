import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/core/utils/service_locator.dart';
import 'package:imdb_top_100/features/home/data/repos/movies_repo/movies_repo_impl.dart';
import 'package:imdb_top_100/features/home/data/repos/series_repo/series_repo_impl.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/movies_cubit/movies_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/series_cubit/series_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/movies_page.dart';
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
        BlocProvider(
          create: (context) => MoviesCubit(getIt.get<MoviesRepoImpl>()),
          child: const MoviesPage(),
        ),
        BlocProvider(
          create: (context) => SeriesCubit(getIt.get<SeriesRepoImpl>()),
          child: const SeriesBody(),
        ),
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
