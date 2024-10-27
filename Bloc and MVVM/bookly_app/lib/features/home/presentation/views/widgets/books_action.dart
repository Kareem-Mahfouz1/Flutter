import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () async {
                Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text: 'Free',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                Uri url = Uri.parse(bookModel.accessInfo!.webReaderLink!);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              backgroundColor: const Color(0xffef8262),
              textColor: Colors.white,
              text: 'Preview',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
