import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/movies_cubit/movies_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/movies_body.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    context.read<MoviesCubit>().getMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MoviesBody(),
      ),
    );
  }
}
