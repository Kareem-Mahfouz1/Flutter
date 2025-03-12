import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/utils/service_locator.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/core/widgets/custom_error_widget.dart';
import 'package:imdb_top_100/features/home/data/repos/series_repo/series_repo_impl.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/series_cubit/series_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/series_details_cubit/series_details_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/views/series_details_view.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/series_grid_view_item.dart';

class SeriesBody extends StatefulWidget {
  const SeriesBody({super.key});

  @override
  State<SeriesBody> createState() => _SeriesBodyState();
}

class _SeriesBodyState extends State<SeriesBody> {
  @override
  void initState() {
    context.read<SeriesCubit>().getSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Top 100 Series', style: Styles.textStyle24),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: BlocBuilder<SeriesCubit, SeriesState>(
              builder: (context, state) {
                if (state is SeriesSuccess) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .5,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemCount: state.series.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => SeriesDetailsCubit(
                                    getIt.get<SeriesRepoImpl>())
                                  ..getSeriesDetails(state.series[index].rank!),
                                child: const SeriesDetailsView(),
                              ),
                            ));
                          },
                          child: SeriesGridViewItem(item: state.series[index]));
                    },
                  );
                } else if (state is SeriesFailure) {
                  return Center(
                      child: CustomErrorWidget(errMessage: state.errMessage));
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  );
                }
              },
            ),
          )),
    ));
  }
}
