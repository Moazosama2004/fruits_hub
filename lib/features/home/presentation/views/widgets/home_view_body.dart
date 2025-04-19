import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_list_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedItemListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
