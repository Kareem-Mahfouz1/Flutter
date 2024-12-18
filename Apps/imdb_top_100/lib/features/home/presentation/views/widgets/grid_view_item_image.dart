import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';

class GridViewItemImage extends StatelessWidget {
  const GridViewItemImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .67,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: myYellow,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error_outline_outlined,
            color: myBlue,
          ),
        ),
      ),
    );
  }
}
