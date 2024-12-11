import 'package:flutter/material.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top 100 Movies',
          style: null,
        ),
      ),
      body: const Center(
        child: Text('Movies'),
      ),
    );
  }
}
