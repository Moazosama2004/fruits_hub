import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/best_selling_fruits_view.dart';

class ProductsResultHeader extends StatelessWidget {
  const ProductsResultHeader({super.key, required this.numberOfResults});

  final int numberOfResults;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$numberOfResults نتائج', style: AppTextStyles.bold16),
        GestureDetector(
          onTap:
              () =>
                  Navigator.pushNamed(context, BestSellingFruitsView.routeName),
          child: SvgPicture.asset(Assets.imagesArrowSwapHorizontal),
        ),
      ],
    );
  }
}
