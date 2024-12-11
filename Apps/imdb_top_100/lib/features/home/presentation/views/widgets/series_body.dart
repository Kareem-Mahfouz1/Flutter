import 'package:flutter/material.dart';

class SeriesBody extends StatelessWidget {
  const SeriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 100 Series'),
      ),
      body: const Center(
        child: Text('Series'),
      ),
    );
  }
}
