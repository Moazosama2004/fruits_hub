import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/poducts_cubit/poducts_cubit.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';

import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_result_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/search_text_field.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(context, title: 'المنتجات'),
                const SizedBox(height: 16),
                const SearchTextField(),
                const SizedBox(height: 12),
                ProductsResultHeader(
                  numberOfResults: context.read<ProductsCubit>().productsResult,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
