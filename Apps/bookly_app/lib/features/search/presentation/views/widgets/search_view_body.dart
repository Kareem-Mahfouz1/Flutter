import 'search_results_list_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomSearchTextField(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Results',
                  style: Styles.textStyle18,
                ),
                SizedBox(height: 10),
                Expanded(child: SearchResultsListView()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
