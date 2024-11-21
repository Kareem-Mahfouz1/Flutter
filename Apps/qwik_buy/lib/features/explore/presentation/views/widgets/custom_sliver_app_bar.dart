import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qwik_buy/core/widgets/custom_back_button.dart';
import 'package:qwik_buy/core/widgets/custom_loading_indicator.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      leading: const Column(
        children: [
          SizedBox(height: 30),
          CustomBackButton(),
        ],
      ),
      expandedHeight: 450,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
            tag: image,
            child: CachedNetworkImage(
              imageUrl: 'https://$image',
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) =>
                  const CustomLoadingIndicator(),
            )),
      ),
    );
  }
}
