import 'package:flutter/material.dart';
import 'package:imdb_top_100/features/home/data/models/series_item.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/grid_view_item_image.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/series_rating_year.dart';

class SeriesGridViewItem extends StatelessWidget {
  const SeriesGridViewItem({super.key, required this.item});
  final SeriesItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GridViewItemImage(imageUrl: item.image!),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                SeriesRatingYear(item: item),
                const SizedBox(height: 3),
                Text(
                  '${item.rank}. ${item.title!}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
