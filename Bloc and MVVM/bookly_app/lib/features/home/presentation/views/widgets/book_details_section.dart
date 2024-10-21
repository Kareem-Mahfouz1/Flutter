import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSetion extends StatelessWidget {
  const BookDetailsSetion({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .17),
          child: const CustomBookItem(
            imageUrl:
                'https://img.freepik.com/free-photo/abstract-autumn-beauty-multi-colored-leaf-vein-pattern-generated-by-ai_188544-9871.jpg',
          ),
        ),
        const SizedBox(height: 35),
        Text(
          'The Jungle Book',
          style: Styles.gentiumBookPlus20.copyWith(
            fontSize: 30,
          ),
        ),
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
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
