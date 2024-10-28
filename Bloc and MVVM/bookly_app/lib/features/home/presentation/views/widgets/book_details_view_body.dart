import '../../../../../core/models/book_model/book_model.dart';

import '../../../../../constants.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(height: 24),
                BookDetailsSetion(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 50)),
                const SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
