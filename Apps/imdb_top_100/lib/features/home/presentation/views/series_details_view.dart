import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/widgets/custom_error_widget.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/series_details_cubit/series_details_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/imdb_button.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/series_details_body.dart';

class SeriesDetailsView extends StatelessWidget {
  const SeriesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SeriesDetailsCubit, SeriesDetailsState>(
        builder: (context, state) {
          if (state is SeriesDetailsSuccess) {
            return SeriesDetailsBody(details: state.details);
          } else if (state is SeriesDetailsFailure) {
            return Center(
              child: CustomErrorWidget(errMessage: state.errMessage),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BlocConsumer<SeriesDetailsCubit, SeriesDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is SeriesDetailsSuccess
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: ImdbButton(url: state.details.imdbLink!),
                )
              : Container();
        },
      ),
    );
  }
}
