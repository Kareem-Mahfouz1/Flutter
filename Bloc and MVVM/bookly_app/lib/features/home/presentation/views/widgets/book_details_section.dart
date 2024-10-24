import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSetion extends StatelessWidget {
  const BookDetailsSetion({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .17),
          child: Hero(
            tag: bookModel.volumeInfo.title!,
            child: CustomBookItem(
              imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            ),
          ),
        ),
        const SizedBox(height: 35),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.gentiumBookPlus20.copyWith(
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors!.join('\n'),
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 35),
        const BooksAction(),
      ],
    );
  }
}
