import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';
import 'package:flutter/material.dart';

class FeaturedItemsListView extends StatelessWidget {
  const FeaturedItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index]),
                    child: Hero(
                      tag: state.books[index].id!,
                      child: CustomBookItem(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks.thumbnail,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
