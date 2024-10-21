import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit.dart/products_cubit_cubit.dart';
import 'package:fruit_hub/core/utils/custom_snak_bar.dart';
import 'package:fruit_hub/core/utils/spacing.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_list.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const CustomHomeAppBar(),
                  verticalSpace(16),
                  const SearchTextField(),
                  verticalSpace(16),
                  const FeaturedList(),
                  verticalSpace(12),
                  const BestSellingHeader(),
                  verticalSpace(12),
                ],
              ),
            ),
          ),
          BlocConsumer<ProductsCubit, ProductsState>(
  listener: (context, state) {
    if (state is ProductsCubitFailureState) {
      showSnackBar(context, text: state.errMessage);
      print(state.errMessage);
    } else if (state is ProductsCubitSuccessState) {
      showSnackBar(context, text: '${state.products.length} products loaded');
    }
  },
  builder: (context, state) {
    if (state is ProductsCubitLoadingState) {
      return  
         SliverToBoxAdapter(child: Center(child: LoadingAnimationWidget.inkDrop(
          color: AppColors.secondaryColor, size: 32)));
      
    } else if (state is ProductsCubitSuccessState) {
      return BestSellingGridView(products: state.products);
    } else if (state is ProductsCubitFailureState) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text('Failed to load products'),
        ),
      );
    }
    // Default case (if state is initial)
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('No data available'),
      ),
    );
  },
)

        ],
      ),
    );
  }
}
