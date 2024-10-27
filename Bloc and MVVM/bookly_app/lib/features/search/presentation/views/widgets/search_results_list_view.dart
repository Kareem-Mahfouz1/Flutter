import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/vertical_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/searcherd_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: VirticalListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchedBooksLoading) {
          return const CustomLoadingIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
