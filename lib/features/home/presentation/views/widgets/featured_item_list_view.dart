import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedItemListView extends StatelessWidget {
  const FeaturedItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => const FeaturedItem(),
      ),
    );
  }
}
