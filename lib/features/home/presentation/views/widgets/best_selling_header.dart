import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/best_selling_fruits_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('الأكثر مبيعًا', style: AppTextStyles.bold16),
        GestureDetector(
          onTap:
              () =>
                  Navigator.pushNamed(context, BestSellingFruitsView.routeName),
          child: Text(
            'المزيد',
            style: AppTextStyles.regular13.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
